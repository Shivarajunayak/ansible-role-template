resource "aws_securityhub_finding_aggregator" "enable_findings" {
  linking_mode      = "SPECIFIED_REGIONS"
  specified_regions = ["us-west-2"]
#  depends_on        = [aws_securityhub_account.enable_security_hub]
}
resource "aws_securityhub_organization_configuration" "security_hub_configuration" {
  auto_enable           = false
  auto_enable_standards = "NONE"
  organization_configuration {
    configuration_type = "CENTRAL"
  }
  depends_on = [aws_securityhub_finding_aggregator.enable_findings]
}
resource "aws_securityhub_configuration_policy" "security_hub_policy" {
  name        = var.security_hub_policy_name
  description = "This is an Security Hub configuration policy"
  configuration_policy {
    service_enabled = true    
    enabled_standard_arns = var.security_hub_standards
    security_controls_configuration {
      disabled_control_identifiers = []
    }
  }
  depends_on = [aws_securityhub_organization_configuration.security_hub_configuration]
}
resource "aws_securityhub_configuration_policy_association" "hmcl_root_org" {
  target_id = var.hmcl_root_org_id
  policy_id = aws_securityhub_configuration_policy.security_hub_policy.id
}