variable "simulator_role_name" {
  description = "Name of the IAM role for Simulator rules"
  type        = string
  default     = "my-iot-role"
}
variable "simulator_policy_name" {
  description = "Custom IAM Policy name"
  type        = string
  default     = ""
}

variable "custom_policy_json" {
  description = "iot role custom policy"
  type        = string
  default     = ""
}

variable "assume_role_policy_action" {
  description = "Simulator role assume role policy"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for AWS resources"
  type        = map(string)
  default     = {}
}
