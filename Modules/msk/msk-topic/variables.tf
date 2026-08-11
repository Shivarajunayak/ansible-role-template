variable "topics" {
  description = "Map of Kafka topics with their configurations"
  type = map(object({
    replication_factor = number
    partitions         = number
    cleanup_policy     = string
  }))
  default = {}
}

variable "bootstrap_servers" {
  description = "Kafka bootstrap servers"
  type        = string
  default     = ""
}
variable "sasl_aws_role_arn" {
  description = "Kafka sasl role arn"
  type        = string
  default     = ""
}

variable "sasl_aws_region" {
  description = "Kafka aws region"
  type        = string
  default     = ""
}
