resource "aws_kms_key" "kms_key_primary" {
  description             = "KMS key for Secrets"
  deletion_window_in_days = var.kms_deletion_window_in_days
  enable_key_rotation     = var.enable_kms_key_rotation
  rotation_period_in_days = var.kms_key_rotation_in_days
  multi_region            = var.kms_multi_region_enable
  tags = var.tags
}

resource "aws_kms_replica_key" "kms_key_replica" {
  count = var.replica_kms_keys ? 1 : 0
  provider                = aws.replica
  description             = "KMS key replica for Secrets"
  deletion_window_in_days = var.kms_deletion_window_in_days
  primary_key_arn         = aws_kms_key.kms_key_primary.arn
  tags = var.replica_tags
}

resource "aws_kms_alias" "kms_key_alias" {
  name          = "alias/${var.kms_key_alias}"
  target_key_id = aws_kms_key.kms_key_primary.key_id
}

resource "aws_kms_alias" "kms_replica_key_alias" {
  count = var.replica_kms_keys ? 1 : 0
  provider      = aws.replica
  name          = "alias/${var.replica_kms_key_alias}"
  target_key_id = aws_kms_replica_key.kms_key_replica[0].key_id
}

resource "aws_kms_key_policy" "primary_key_policy" {
  key_id = aws_kms_key.kms_key_primary.id
  policy = var.kms_key_policy_documents
}

resource "aws_kms_key_policy" "kms_key_replica" {
  count = var.replica_kms_keys ? 1 : 0
  provider = aws.replica
  key_id   = aws_kms_replica_key.kms_key_replica[0].id
  policy   = var.replica_kms_key_policy_documents
}