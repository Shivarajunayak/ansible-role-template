variable "iam_role_name" {
  description = "The name of the IAM role"
  type        = string
  default     = ""
}

variable "iam_policy_name" {
  description = "The name of the IAM policy"
  type        = string
  default     = ""
}

variable "custom_policy_json" {
  description = "The JSON policy document for the custom IAM policy"
  type        = string
  default     = ""
}

variable "rule_name" {
  description = "The name of the IoT topic rule"
  type        = string
  default     = ""
}

variable "open_search_sql" {
  description = "The SQL statement for the OpenSearch action"
  type        = string
  default     = ""
}

variable "open_search_description" {
  description = "The description for the OpenSearch action"
  type        = string
  default     = ""
}

variable "endpoint" {
  description = "The endpoint for the OpenSearch action"
  type        = string
  default     = ""
}

variable "index" {
  description = "The index for the OpenSearch action"
  type        = string
  default     = ""
}

variable "id" {
  description = "The ID for the OpenSearch action"
  type        = string
  default     = ""
}

variable "type" {
  description = "The type for the OpenSearch action"
  type        = string
  default     = ""
}

variable "role_arn" {
  description = "The ARN of the role for the OpenSearch and Republish actions"
  type        = string
  default     = ""
}

variable "topic" {
  description = "The topic for the Republish action"
  type        = string
  default     = ""
}

variable "qos" {
  description = "The QoS level for the Republish action"
  type        = number
  default     = 1
}

variable "log_group_name" {
  description = "The log group name for the CloudWatch Logs error action"
  type        = string
  default     = ""
}

variable "batch_mode" {
  description = "The batch mode for the CloudWatch Logs error action"
  type        = bool
  default     = false
}