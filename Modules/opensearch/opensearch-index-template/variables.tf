variable "opensearch_endpoint" {
  description = "The OpenSearch service endpoint"
  type        = string
  default     = ""
}

variable "template_name" {
  description = "The name of the index template"
  type        = string
}

variable "body" {
  description = "The body of the index template"
  type        = string
}

variable "aws_region" {
  description = "opensearch aws region"
  type        = string
  default     = ""
}
variable "opensearch_secret_name" {
  description = "Opensearch Secret Name"
  type        = string
  default     = ""
}
variable "version_ping_timeout" {
  description = "opensearch version ping timeout"
  type        = number
  default     = 10
}

variable "sign_aws_requests" {
  description = "opensearch sign aws requests"
  type        = bool
  default     = false
}
