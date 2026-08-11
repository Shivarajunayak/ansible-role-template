resource "aws_cloudformation_stack" "auto_sec_hub_findings_admin_stack" {
  name = var.cf_stack_name
  parameters = var.cf_stack_parameters
  template_url = var.cf_template_url
  capabilities = var.capabilities
  on_failure         = var.on_failure
  timeout_in_minutes = var.timeout_in_minutes
  tags = var.tags
}