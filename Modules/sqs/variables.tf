variable "sqs_queues" {
  description = "object consisting of details for SqS queues"
  type        = any
  default     = {}
}

variable "tags" {
  description = "tags for sqs"
  type        = any
  default     = {}
}
