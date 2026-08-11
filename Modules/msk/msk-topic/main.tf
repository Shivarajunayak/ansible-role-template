provider "kafka" {
  bootstrap_servers = split(",", var.bootstrap_servers)
  tls_enabled       = true
  sasl_mechanism    = "aws-iam"
  sasl_aws_region   = var.sasl_aws_region
  sasl_aws_role_arn = var.sasl_aws_role_arn
}
resource "kafka_topic" "logs" {
  for_each = var.topics
  name               = try(each.key, null) # Use the key as the topic name
  replication_factor = try(each.value.replication_factor, null)
  partitions         = try(each.value.partitions, null)
  config = {
    "segment.ms"     = try(each.value.segment_ms, null)
    "cleanup.policy" = try(each.value.cleanup_policy, null)
  }
}