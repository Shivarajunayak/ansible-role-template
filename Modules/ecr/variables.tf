variable "repositories" {
  type = any
}
variable "force_delete" {
  type    = bool
  default = false
}

variable "image_tag_mutability" {
  type    = string
  default = "IMMUTABLE"
}

variable "encryption_type" {
  type    = string
  default = "AES256"
}

variable "kms_key" {
  type    = string
  default = ""
}
variable "allowed_accounts" {
  type    = list(string)
  default = null
}

variable "lifecycle_policy_rules" {
  type    = map(string)
  default     = {
    "key1" = "value1"
    "key2" = "value2"
    "key3" = "value3"
  }
}

variable "default_lifecycle_policy" {
  type    = string
  default = ""
}

