variable "member_config" {
  type = list(object({
    account_id = number
  }))
  default = null
}
variable "ec2_scanning" {
  type = bool
  default = false
}
variable "ecr_scanning" {
  type = bool
  default = false
}
variable "lambda_scanning" {
  type = bool
  default = false
}
variable "inspector_admin_account" {
  type = string
}
variable "lambda_code_scanning" {
  type = bool
  default = false
}