variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = ""
}
variable "account_id" {
  description = "Your 12-digit AWS account ID"
  type        = string
  default     = "905418263290"
}
variable "iot_role_arn" {
  description = "The ARN of the IAM role that grants AWS IoT permission to perform audits"
  type        = string
  default     = ""
}

variable "audit_checks" {
  description = "Configuration for audit checks"
  type = map(object({
    enabled = bool
  }))
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = any
  default     = {}
}

variable "iot_role_name" {
  description = "The name of the IAM role for IoT audit"
  type        = string
  default     = ""
}
variable "iot_policy_name" {
  description = "The name of the IAM policy for IoT audit"
  type        = string
  default     = ""
}
variable "sns_role_name" {
  description = "The name of the IAM role for SNS notifications"
  type        = string
  default     = ""
}
variable "sns_policy_name" {
  description = "The name of the IAM policy for SNS notifications"
  type        = string
  default     = ""
}
variable "sns_topic_name" {
  description = "The name of the SNS topic for audit notifications"
  type        = string
  default     = ""
}

variable "kms_master_key_id" {
  description = "KMS Key ID to encrypt and decrypt SNS topics for IoT device defender"
  type        = string
  default     = ""
}

variable "iot_assume_role_policy" {
  description = "Assume role policy for the IoT role"
  type        = string
}
variable "iot_policy_document" {
  description = "Policy document for the IoT policy"
  type        = string
}
variable "sns_assume_role_policy" {
  description = "Assume role policy for the SNS role"
  type        = string
}
variable "sns_policy_document" {
  description = "Policy document for the SNS policy"
  type        = string
}
