variable "sns_topic_name" {
  description = "SNS Topic Name for KMS Notification"
  type        = string
}
variable "kms_notification_email_id" {
  description = "SNS Topic Subscription Email ID for KMS Notification"
  type        = string
}
variable "kms_deletion_rule_name" {
  description = "KMS Deletion Rule Name"
  type        = string
}
variable "kms_disable_rule_name" {
  description = "KMS Deletion Rule Name"
  type        = string
}
variable "kms_key_alias" {
  description = "KMS Key ID Alias Name"
  type        = string
}


