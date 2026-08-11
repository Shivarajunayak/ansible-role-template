resource "aws_inspector2_enabler" "enable_inspector" {
  account_ids    = [var.inspector_admin_account]
  resource_types = ["ECR", "EC2"]
}
resource "aws_inspector2_organization_configuration" "enable_org_inspector" {
  auto_enable {
    ec2    = try(var.ec2_scanning, null)
    ecr    = try(var.ecr_scanning, null)
    lambda = try(var.lambda_scanning, null)
    lambda_code = try(var.lambda_code_scanning, null)
  }
}

resource "aws_inspector2_member_association" "inspector_account_config" {
  for_each = var.member_config != null ? { for member in var.member_config : member.account_id => member } : {}
  account_id = each.value.account_id
}