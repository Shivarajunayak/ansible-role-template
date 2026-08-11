

variable "iam_role_name" {
  description = "Name of the IAM role for Flink job"
  type        = string
  default     = "my-flink-role"
}
variable "iam_policy_name" {
  description = "Custom IAM Policy name"
  type        = string
  default     = ""
}

variable "managed_policies" {
  description = "Managed Policies ARN List"
  type        = any
  default     = {}
}

variable "assume_role_policy" {
  description = "Flink role assume role policy"
  type        = string
}


variable "custom_policy_json" {
  description = "Flink role custom policy"
  type        = string
}

variable "tags" {
  description = "Tags for AWS resources"
  type        = map(string)
}
