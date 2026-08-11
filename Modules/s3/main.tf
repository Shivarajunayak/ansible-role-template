module "s3_bucket" {
  source = "./aws-s3"

  create_bucket                        = try(var.create_bucket, null)
  bucket                               = try(var.bucket, null)
  tags                                 = try(var.tags, null)
  force_destroy                        = try(var.force_destroy, null)
  versioning                           = try(var.versioning, null)
  object_lock_enabled                  = try(var.object_lock_enabled, null)
  object_lock_configuration            = try(var.object_lock_configuration, null)
  lifecycle_rule                       = try(var.lifecycle_rule, null)
  server_side_encryption_configuration = try(var.server_side_encryption_configuration, null)
  attach_policy                        = try(var.attach_policy, null)

  attach_deny_insecure_transport_policy    = try(var.attach_deny_insecure_transport_policy, null)
  attach_require_latest_tls_policy         = try(var.attach_require_latest_tls_policy, null)
  attach_deny_incorrect_encryption_headers = try(var.attach_deny_incorrect_encryption_headers, null)
  attach_deny_incorrect_kms_key_sse        = try(var.attach_deny_incorrect_kms_key_sse, null)
  allowed_kms_key_arn                      = try(var.allowed_kms_key_arn, null)
  attach_deny_unencrypted_object_uploads   = try(var.attach_deny_unencrypted_object_uploads, null)

  metric_configuration                       = try(var.metric_configuration, null)
  acl                                        = try(var.acl, null)
  policy                                     = try(var.policy, null)
  acceleration_status                        = try(var.acceleration_status, null)
  request_payer                              = try(var.request_payer, null)
  website                                    = try(var.website, null)
  cors_rule                                  = try(var.cors_rule, null)
  logging                                    = try(var.logging, null)
  access_log_delivery_policy_source_buckets  = try(var.access_log_delivery_policy_source_buckets, null)
  access_log_delivery_policy_source_accounts = try(var.access_log_delivery_policy_source_accounts, null)
  grant                                      = try(var.grant, null)
  owner                                      = try(var.owner, null)
  expected_bucket_owner                      = try(var.expected_bucket_owner, null)
  replication_configuration                  = try(var.replication_configuration, null)
  intelligent_tiering                        = try(var.intelligent_tiering, null)
  inventory_configuration                    = try(var.inventory_configuration, null)
  inventory_source_account_id                = try(var.inventory_source_account_id, null)
  inventory_source_bucket_arn                = try(var.inventory_source_bucket_arn, null)
  inventory_self_source_destination          = try(var.inventory_self_source_destination, null)
  analytics_configuration                    = try(var.analytics_configuration, null)
  analytics_source_account_id                = try(var.analytics_source_account_id, null)
  analytics_source_bucket_arn                = try(var.analytics_source_bucket_arn, null)
  analytics_self_source_destination          = try(var.analytics_self_source_destination, null)
  block_public_acls                          = try(var.block_public_acls, null)
  block_public_policy                        = try(var.block_public_policy, null)
  ignore_public_acls                         = try(var.ignore_public_acls, null)
  restrict_public_buckets                    = try(var.restrict_public_buckets, null)
  control_object_ownership                   = try(var.control_object_ownership, null)
  object_ownership                           = try(var.object_ownership, null)
}

####S3 Object Sample zip for lambda source buckets####
module "s3_object" {

  count = var.create_bucket && var.is_lambda_code_bucket ? 1 : 0

  source      = "./aws-s3/modules/object"
  bucket      = module.s3_bucket.s3_bucket_id
  key         = "my-function.zip"
  file_source = "${path.module}/sample-lambda-zip/my-function.zip"
}

module "s3_object_code_updater_lambda" {

  count = var.create_bucket && var.is_lambda_code_bucket ? 1 : 0

  source      = "./aws-s3/modules/object"
  bucket      = module.s3_bucket.s3_bucket_id
  key         = "lambda-code-updater/lambda-code-updater.zip"
  file_source = "${path.module}/sample-lambda-zip/lambda-code-updater.zip"
}

module "s3_object_flink_s3" {

  count = var.create_bucket && var.is_flink_bucket ? 1 : 0

  source      = "./aws-s3/modules/object"
  bucket      = module.s3_bucket.s3_bucket_id
  key         = "my-flink.jar"
  file_source = "${path.module}/sample-flink-jar/my-flink.jar"
}

module "s3_object_debezium_connector_zip" {

  count = var.create_bucket && var.is_debezium_connector_bucket ? 1 : 0

  source      = "./aws-s3/modules/object"
  bucket      = module.s3_bucket.s3_bucket_id
  key         = "debezium-connector-postgres-2.7.1.Final-plugin.zip"
  file_source = "${path.module}/debezium-connector-zip/debezium-connector-postgres-2.7.1.Final-plugin.zip"
}