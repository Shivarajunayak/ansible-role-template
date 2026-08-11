variable "opensearch_endpoint" {
  description = "The OpenSearch service endpoint"
  type        = string
  default     = ""
}

variable "indices" {
  description = "Map of indices configurations"
  type = any
  default = {}
}

variable "index_alias_name" {
  description = "The name of the OpenSearch index with alias"
  type        = string
  default     = ""
}

variable "index_aliases" {
  description = "The aliases for the OpenSearch index (JSON)"
  type        = string
  default     = ""
}

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
