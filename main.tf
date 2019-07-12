data "aws_iam_policy_document" "assume_cross_account_policy" {
  statement {
    sid       = "EKSWorkerAssumeOperationsLogging"
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = [var.assume_role_arn]
  }
}

resource "aws_iam_policy" "assume_cross_account_policy" {
  name   = "elasticsearch-logging-${var.region}-${var.elasticsearch_domain_name}"
  policy = data.aws_iam_policy_document.assume_cross_account_policy.json
}

resource "aws_iam_role_policy_attachment" "cluster_worker_cross_account" {
  count      = var.cluster_worker_role_name != "" ? 1 : 0
  role       = var.cluster_worker_role_name
  policy_arn = aws_iam_policy.assume_cross_account_policy.arn
}

# Install fluentd via Helm
data "template_file" "fluentd_values" {
  template = file("${path.module}/templates/helm_fluentd_values.yaml.tpl")

  vars = {
    elasticsearch_endpoint   = "https://${var.elasticsearch_endpoint}"
    image_url                = var.fluentd_image_repository
    image_tag                = var.fluentd_image_tag
    region                   = var.region
    logstash_prefix          = var.elasticsearch_logstash_prefix
    assume_role_arn          = var.assume_role_arn
    assume_role_session_name = var.assume_role_session_name
    aws_account_id           = var.application_aws_account_number
  }
}

resource "helm_release" "fluentd" {
  name       = var.fluentd_release_name
  chart      = "stable/fluentd-elasticsearch"
  namespace  = var.fluentd_namespace
  values     = [data.template_file.fluentd_values.rendered]
  depends_on = [aws_iam_role_policy_attachment.cluster_worker_cross_account]
}

