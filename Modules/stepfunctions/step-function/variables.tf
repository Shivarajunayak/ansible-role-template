variable "create" {
  description = "Whether to create the resources"
  type        = bool
  default     = true
}
variable "name" {
  description = "Name of the Step Functions state machine"
  type        = string
  default     = ""
}
variable "stepfunction_role_arn" {
  description = "ARN of the IAM role for the Step Functions state machine"
  type        = string
  default     = ""
}
variable "definition" {
  description = "Definition of the Step Functions state machine"
  type        = string
  default     = ""
}
variable "type" {
  description = "Type of the Step Functions state machine (e.g., EXPRESS, STANDARD)"
  type        = string
  default     = ""
}
variable "logging_configuration" {
  description = "Logging configuration for the Step Functions state machine"
  type        = map(any)
  default     = {}
}
variable "tags" {
  description = "Tags to apply to both resources"
  type        = map(string)
  default     = {}
}
variable "publish" {
  description = "Whether to publish the Step Functions state machine"
  type        = bool
  default     = false
}
variable "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch log group"
  type        = string
  default     = ""
}
variable "cloudwatch_log_group_retention_in_days" {
  description = "Retention period of CloudWatch logs in days"
  type        = number
  default     = 7
}
variable "cloudwatch_log_group_kms_key_id" {
  description = "KMS key ID for encrypting CloudWatch logs"
  type        = string
  default     = ""
}
variable "cloudwatch_log_group_tags" {
  description = "Tags to apply to the CloudWatch log group"
  type        = map(string)
  default     = {}
}
