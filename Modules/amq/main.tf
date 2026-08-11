data "aws_secretsmanager_secret" "mq_secret" {
  name = var.mq_secret_name
}

data "aws_secretsmanager_secret_version" "mq_secret_version" {
  secret_id = data.aws_secretsmanager_secret.mq_secret.id
}

# To decode the JSON secret_string and extract the values:
locals {
  secret = jsondecode(data.aws_secretsmanager_secret_version.mq_secret_version.secret_string)
}

resource "aws_mq_configuration" "example" {

  name           = var.configuration_name
  engine_type    = var.engine_type
  engine_version = var.engine_version

  data = var.mq_configuration_data

  tags = var.tags
}

resource "aws_mq_broker" "example" {
  broker_name                = var.broker_name
  deployment_mode            = var.deployment_mode
  engine_type                = var.engine_type
  engine_version             = var.engine_version
  host_instance_type         = var.host_instance_type
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  apply_immediately          = var.apply_immediately
  publicly_accessible        = var.publicly_accessible
  subnet_ids                 = var.subnet_ids
  security_groups            = var.security_groups
  storage_type               = var.storage_type

  user {
    username = local.secret.username
    password = local.secret.password
  }

  configuration {
    id       = aws_mq_configuration.example.id
    revision = aws_mq_configuration.example.latest_revision
  }

  encryption_options {
    kms_key_id        = var.kms_key_id
    use_aws_owned_key = false
  }

  logs {
    audit   = var.enable_audit_logs
    general = var.enable_general_logs
  }

  tags = var.tags
}
