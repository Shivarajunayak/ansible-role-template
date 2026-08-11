resource "aws_organizations_delegated_administrator" "iam_access_analyzer_admin" {
  account_id        = var.iam_access_analyzer_admin_account
  service_principal = "access-analyzer.amazonaws.com"
}