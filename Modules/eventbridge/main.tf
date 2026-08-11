module "eventbridge_lambda" {
  source = "./aws-eventbridge"

  create_role = var.create_role
  role_name = var.role_name
  create_bus = var.create_bus
  rules = var.rules
  targets = try(var.targets, {})

  tags  = var.tags
}