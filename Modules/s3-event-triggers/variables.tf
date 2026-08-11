variable "bucket_name" {
  description = "Trigger bucket name"
  type        = string
  default     = ""
}
variable "eventbridge" {
  description = "Enable Eventbridge"
  type        = any
  default     = {}
}
variable "lambda_notifications" {
  description = "lambda trigger config"
  type        = any
  default     = {}
}

variable "sns_notifications" {
  description = "sns trigger config"
  type        = any
  default     = {}
}

variable "sqs_notifications" {
  description = "sqs trigger config"
  type        = any
  default     = {}
}
