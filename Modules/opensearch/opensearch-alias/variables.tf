variable "opensearch_endpoint" {
  description = "The OpenSearch service endpoint"
  type        = string
  default     = ""
}

variable "number_of_shards" {
  description = "The number of shards for the OpenSearch index"
  type        = number
  default     = 1
}

variable "number_of_replicas" {
  description = "The number of replicas for the OpenSearch index"
  type        = number
  default     = 1
}

variable "index_mappings" {
  description = "The mappings for the OpenSearch index (JSON)"
  type        = string
  default     = ""
}

variable "index_alias_name" {
  description = "The name of the OpenSearch index with alias"
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

variable "indexes" {
  description = "List of indexes with their configurations"
  type        = list(object({
    name               = string
    number_of_replicas = string
    number_of_shards   = string
    aliases            = map(object({
      is_write_index = bool
    }))
    mappings = map(any)
  }))
}