resource "aws_inspector2_delegated_admin_account" "delegated_inspector_admin" {
  account_id = var.inspector_delegated_admin_account
}