variable "hmcl_root_org_id" {
  description = "Provide HMCL root organization ID"
  type        = string
}
variable "security_hub_policy_name" {
  description = "Provide Security Hub Policy Name"
  type        = string
}


variable "security_hub_standards" {
  description = "Provide Security Hub Standards"
  type        = list(string)
}