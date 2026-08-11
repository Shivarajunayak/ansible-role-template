variable "is_kong_cluster" {
  description = "Controls if resources should be created for kong"
  type        = bool
  default     = false
}

variable "kong_secret_name" {
  description = "Kong dev secret manager name"
  type        = string
  default     = ""
}

variable "kong_qa_secret_name" {
  description = "Kong qa secret manager name"
  type        = string
  default     = ""
}

variable "kong_uat_secret_name" {
  description = "Kong uat secret manager name"
  type        = string
  default     = ""
}

variable "kong_prod_secret_name" {
  description = "Kong prod secret manager name"
  type        = string
  default     = ""
}

 variable "kong_dev_new_secret_name" {
   description = "Kong dev secret manager name"
   type        = string
   default     = ""
 }

  variable "kong_qa_new_secret_name" {
   description = "Kong qa secret manager name"
   type        = string
   default     = ""
 }
