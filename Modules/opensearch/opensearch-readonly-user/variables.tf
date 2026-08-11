variable "aws_region" {
  description = "opensearch aws region"
  type        = string
  default     = ""
}
variable "version_ping_timeout" {
  description = "opensearch version ping timeout"
  type        = number
  default     = 10
}

variable "opensearch_secret_name" {
  description = "Opensearch Secret Name"
  type        = string
  default     = ""
}

variable "sign_aws_requests" {
  description = "opensearch sign aws requests"
  type        = bool
  default     = false
}

variable "opensearch_endpoint" {
  description = "The OpenSearch service endpoint"
  type        = string
  default     = ""
}


variable "readonly_user" {
  description = "The OpenSearch user"
  type        = string
  default     = ""
}
variable "readonly_user_password" {
  description = "The OpenSearch password"
  type        = string
  default     = ""
}
