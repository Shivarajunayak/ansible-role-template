module "aws_cognito_user_pool_complete" {

  source  = "./aws-cognito"
  
  user_pool_name           = try(var.user_pool_name, null)
  alias_attributes         = try(var.alias_attributes, null)
  auto_verified_attributes = try(var.auto_verified_attributes, null)

  deletion_protection = try(var.deletion_protection, null)

  sms_authentication_message = try(var.sms_authentication_message, null)
  sms_verification_message   = try(var.sms_verification_message, null)

  user_pool_add_ons_advanced_security_mode           = try(var.user_pool_add_ons_advanced_security_mode, null)
  verification_message_template_default_email_option = try(var.verification_message_template_default_email_option, null)

  admin_create_user_config = {
    email_subject = try(var.admin_create_user_config_email_subject, null)
    email_message = try(var.admin_create_user_config_email_message, null)
    sms_message   = try(var.admin_create_user_config_sms_message, null)
  }

  

  device_configuration = {
    challenge_required_on_new_device      = try(var.device_configuration_challenge_required_on_new_device, null)
    device_only_remembered_on_user_prompt = try(var.device_configuration_device_only_remembered_on_user_prompt, null)
  }

  email_configuration = {
    email_sending_account  = try(var.email_configuration_email_sending_account, null)
    reply_to_email_address = try(var.email_configuration_reply_to_email_address, null)
    source_arn             = try(var.email_configuration_source_arn, null)
  }

  password_policy = {
    minimum_length                   = try(var.password_policy_minimum_length, null)
    require_lowercase                = try(var.password_policy_require_lowercase, null)
    require_numbers                  = try(var.password_policy_require_numbers, null)
    require_symbols                  = try(var.password_policy_require_symbols, null)
    require_uppercase                = try(var.password_policy_require_uppercase, null)
    temporary_password_validity_days = try(var.password_policy_temporary_password_validity_days, null)
  }

  user_pool_add_ons = {
    advanced_security_mode = try(var.user_pool_add_ons_advanced_security_mode, null)
  }
  verification_message_template = {
    default_email_option = try(var.verification_message_template_default_email_option, null)
  }

  schemas        = try(var.schemas, null)
  string_schemas = try(var.string_schemas, null)
  number_schemas = try(var.number_schemas, null)

  recovery_mechanisms = try(var.recovery_mechanisms, null)

  domain = try(var.domain, null)
  domain_certificate_arn = try(var.domain_certificate_arn, null)
  
  clients = try(var.clients, [])


  user_group_name        = try(var.user_group_name, null)
  user_group_description = try(var.user_group_description, null)
  user_group_precedence  = try(var.user_group_precedence, null)
  user_group_role_arn    = try(var.user_group_role_arn, null)

  resource_server_identifier        = try(var.resource_server_identifier, null)
  resource_server_name              = try(var.resource_server_name, null)
  resource_server_scope_name        = try(var.resource_server_scope_name, null)
  resource_server_scope_description = try(var.resource_server_scope_description, null)
  identity_providers                = try(var.identity_providers, null)


  lambda_config = try(var.lambda_config, {})


  tags = try(var.tags, null)

}


