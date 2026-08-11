variable "kms_deletion_window_in_days" {
  description = "KMS Key Deletion Window in days"
  type        = number
}
variable "enable_kms_key_rotation" {
  description = "Enable KMS Key Rotation"
  type        = bool
}
variable "kms_key_rotation_in_days" {
  description = "KMS Key Rotation in days"
  type        = number
}
variable "kms_multi_region_enable" {
  description = "Create multi region KMS Key"
  type        = bool
}
variable "kms_key_alias" {
  description = "KMS Key Alias"
  type        = string
}
variable "replica_kms_key_alias" {
  description = "KMS Key Alias"
  type        = string
}
variable "replica_kms_keys" {
  description = "True/False whether you need KMS key replica in another region"
  type        = bool
}
variable "kms_key_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
  type        = string
  default     = ""
}
variable "replica_kms_key_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
  type        = string
  default     = ""
}
variable "tags" {
  description = "Tags"
  type        = any
  default     = {}
}
variable "replica_tags" {
  description = "Tags"
  type        = any
  default     = {}
}