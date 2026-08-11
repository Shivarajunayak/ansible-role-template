variable "opensearch_endpoint" {
  description = "The OpenSearch endpoint URL"
  type        = string
}
variable "aws_region" {
  description = "AWS Region"
  type        = string
}
variable "version_ping_timeout" {
  description = "Timeout for version ping"
  type        = string
  default     = "5s"
}
variable "opensearch_secret_name" {
  description = "Opensearch Secret Name"
  type        = string
  default     = ""
}

variable "sign_aws_requests" {
  description = "Boolean to determine if AWS request signing is enabled"
  type        = bool
  default     = false
}

variable "data_stream_name" {
  description = "The name of the OpenSearch data stream"
  type        = string
  default     = "foo-data-stream"
}

variable "template_name" {
  description = "The name of the index template"
  type        = string
}

variable "body" {
  description = "The body of the index template"
  type        = string
}

variable "enable_template" {
  description = "Whether to enable template"
  type        = bool
  default     = false
}