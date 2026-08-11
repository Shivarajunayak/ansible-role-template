

variable "scheduled_audit_name" {
  description = "The name of the scheduled audit."
  type        = string
}

variable "frequency" {
  description = "The frequency of the scheduled audit."
  type        = string
}

variable "day_of_month" {
  description = "The day of the month for the scheduled audit."
  type        = string
}

variable "target_check_names" {
  description = "The list of checks to be performed during the audit."
  type        = list(string)
}

