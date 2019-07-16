# terraform-aws-logging-app

A terraform module to create a logging infrastructure based around Fluentd and connect to external Elasticsearch.  

# Notes

Terraform version  `>= 0.12`

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| `application_aws_account_number` | AWS application account number (without hyphens) | n/a | n/a |  yes |
| `assume_role_arn` | IAM Role ARN for fluentd to assume for access to ElasticSearch | n/a | n/a |  yes |
| `assume_role_session_name` | Session name for the assumed role | n/a | `"fluentd-elasticsearch"` |  no |
| `cluster_context` | The kubernetes context to use for deployment of fluentd | n/a | n/a |  yes |
| `cluster_worker_role_name` | IAM role name of the cluster worker group to attach to the logging policy | n/a | n/a |  yes |
| `elasticsearch_domain_name` | Domain name of the elasticsearch cluster | n/a | n/a |  yes |
| `elasticsearch_endpoint` | ElasticSearch endpoint URL | n/a | n/a |  yes |
| `elasticsearch_logstash_prefix` | Prefix of logstash indexes created in ElasticSearch | n/a | `"logstash"` |  no |
| `fluentd_image_repository` | The URI of the repository containing the fluentd image | n/a | n/a |  yes |
| `fluentd_image_tag` | The tag of the image to use for fluentd | n/a | `"latest"` |  no |
| `fluentd_namespace` | The kubernetes namespace to use for the fluentd deployment | n/a | `"logging"` |  no |
| `fluentd_release_name` | Name for the fluentd deployment | n/a | `"fluentd-elasticsearch"` |  no |
| `region` | AWS region name | n/a | n/a |  yes |
| `tags` | Map of tags to apply to resources | map(string) | n/a |  yes |
| `tiller_service_account` | Tiller service account name used for helm | n/a | `"tiller"` |  no |
