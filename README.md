# terraform-aws-logging-app

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| application_aws_account_number | AWS application account number (without hyphens) | string | - | yes |
| assume_role_arn | IAM Role ARN for fluentd to assume for access to ElasticSearch | string | - | yes |
| assume_role_session_name | Session name for the assumed role | string | `fluentd-elasticsearch` | no |
| cluster_context | The kubernetes context to use for deployment of fluentd | string | `` | no |
| cluster_worker_role_name | IAM role name of the cluster worker group to attach to the logging policy | string | - | yes |
| elasticsearch_domain_name | Domain name of the elasticsearch cluster | string | - | yes |
| elasticsearch_endpoint | ElasticSearch endpoint URL | string | - | yes |
| elasticsearch_logstash_prefix | Prefix of logstash indexes created in ElasticSearch | string | `logstash` | no |
| fluentd_image_repository | The URI of the repository containing the fluentd image | string | `` | no |
| fluentd_image_tag | The tag of the image to use for fluentd | string | `latest` | no |
| fluentd_namespace | The kubernetes namespace to use for the fluentd deployment | string | `logging` | no |
| fluentd_release_name | Name for the fluentd deployment | string | `fluentd-elasticsearch` | no |
| region | AWS region name | string | - | yes |
| tags | Map of tags to apply to resources | map | `<map>` | no |
| tiller_service_account | Tiller service account name used for helm | string | `tiller` | no |
