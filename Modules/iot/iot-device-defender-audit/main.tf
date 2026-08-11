resource "aws_iam_role" "iot_audit_role" {
  name               = var.iot_role_name
  assume_role_policy = var.iot_assume_role_policy
  tags               = var.tags
}
resource "aws_iam_policy" "iot_audit_policy" {
  name        = var.iot_policy_name
  description = "Policy to allow AWS IoT to access resources for auditing"
  policy      = var.iot_policy_document
  tags        = var.tags
}
resource "aws_iam_role_policy_attachment" "iot_audit_role_attachment" {
  role       = aws_iam_role.iot_audit_role.name
  policy_arn = aws_iam_policy.iot_audit_policy.arn
}

resource "aws_iam_role" "sns_role" {
  name               = var.sns_role_name
  assume_role_policy = var.sns_assume_role_policy
  tags               = var.tags
}

resource "aws_iam_policy" "sns_policy" {
  name        = var.sns_policy_name
  description = "Policy to allow publishing to SNS topics"
  policy      = var.sns_policy_document
  tags        = var.tags
}

resource "aws_iam_role_policy_attachment" "sns_role_attachment" {
  role       = aws_iam_role.sns_role.name
  policy_arn = aws_iam_policy.sns_policy.arn
}


resource "aws_sns_topic" "iot_audit_sns_topic" {
  name              = var.sns_topic_name
  kms_master_key_id = var.kms_master_key_id
  tags              = var.tags
}

resource "awscc_iot_account_audit_configuration" "iot_audit_config" {
  account_id = var.account_id
  role_arn   = aws_iam_role.iot_audit_role.arn

  audit_check_configurations = {
    authenticated_cognito_role_overly_permissive_check = {
      enabled = var.audit_checks.authenticated_cognito_role_overly_permissive_check.enabled
    }
    ca_certificate_expiring_check = {
      enabled = var.audit_checks.ca_certificate_expiring_check.enabled
    }
    ca_certificate_key_quality_check = {
      enabled = var.audit_checks.ca_certificate_key_quality_check.enabled
    }
    conflicting_client_ids_check = {
      enabled = var.audit_checks.conflicting_client_ids_check.enabled
    }
    device_certificate_expiring_check = {
      enabled = var.audit_checks.device_certificate_expiring_check.enabled
    }
    device_certificate_key_quality_check = {
      enabled = var.audit_checks.device_certificate_key_quality_check.enabled
    }
    device_certificate_shared_check = {
      enabled = var.audit_checks.device_certificate_shared_check.enabled
    }
    intermediate_ca_revoked_for_active_device_certificates_check = {
      enabled = var.audit_checks.intermediate_ca_revoked_for_active_device_certificates_check.enabled
    }
    iot_policy_potential_mis_configuration_check = {
      enabled = var.audit_checks.io_t_policy_potential_mis_configuration_check.enabled
    }
    iot_policy_overly_permissive_check = {
      enabled = var.audit_checks.iot_policy_overly_permissive_check.enabled
    }
    iot_role_alias_allows_access_to_unused_services_check = {
      enabled = var.audit_checks.iot_role_alias_allows_access_to_unused_services_check.enabled
    }
    iot_role_alias_overly_permissive_check = {
      enabled = var.audit_checks.iot_role_alias_overly_permissive_check.enabled
    }
    logging_disabled_check = {
      enabled = var.audit_checks.logging_disabled_check.enabled
    }
    revoked_ca_certificate_still_active_check = {
      enabled = var.audit_checks.revoked_ca_certificate_still_active_check.enabled
    }
    revoked_device_certificate_still_active_check = {
      enabled = var.audit_checks.revoked_device_certificate_still_active_check.enabled
    }
    unauthenticated_cognito_role_overly_permissive_check = {
      enabled = var.audit_checks.unauthenticated_cognito_role_overly_permissive_check.enabled
    }
  }

}
