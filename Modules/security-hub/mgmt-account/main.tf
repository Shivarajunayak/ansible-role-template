resource "aws_securityhub_account" "security_hub" {
  enable_default_standards = false
}

resource "time_sleep" "wait_securityhub_enable" {
  create_duration = "10s"
  depends_on = [aws_securityhub_account.security_hub]
}

resource "aws_securityhub_organization_admin_account" "enable_delgated_admin" {
  depends_on       = [aws_securityhub_account.security_hub]
  admin_account_id = var.securityhub_admin_account
}