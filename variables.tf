variable "region" {
  description = "AWS region name"
}

variable "elasticsearch_domain_name" {
  description = "Domain name of the elasticsearch cluster"
}

variable "elasticsearch_endpoint" {
  description = "ElasticSearch endpoint URL"
}

variable "elasticsearch_logstash_prefix" {
  description = "Prefix of logstash indexes created in ElasticSearch"
  default     = "logstash"
}

variable "assume_role_arn" {
  description = "IAM Role ARN for fluentd to assume for access to ElasticSearch"
}

variable "assume_role_session_name" {
  description = "Session name for the assumed role"
  default     = "fluentd-elasticsearch"
}

variable "cluster_context" {
  description = "The kubernetes context to use for deployment of fluentd"
  default     = ""
}

variable "tiller_service_account" {
  description = "Tiller service account name used for helm"
  default     = "tiller"
}

variable "fluentd_namespace" {
  description = "The kubernetes namespace to use for the fluentd deployment"
  default     = "logging"
}

variable "fluentd_release_name" {
  description = "Name for the fluentd deployment"
  default     = "fluentd-elasticsearch"
}

variable "fluentd_image_repository" {
  description = "The URI of the repository containing the fluentd image"
  default     = ""
}

variable "fluentd_image_tag" {
  description = "The tag of the image to use for fluentd"
  default     = "latest"
}

variable "cluster_worker_role_name" {
  description = "IAM role name of the cluster worker group to attach to the logging policy"
}

variable "tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "application_aws_account_number" {
  description = "AWS application account number (without hyphens)"
}

