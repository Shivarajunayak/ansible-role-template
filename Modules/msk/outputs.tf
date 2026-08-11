output "bootstrap_brokers_sasl_iam" {
  description = "One or more DNS names (or IP addresses) and SASL IAM port pairs. This attribute will have a value if `encryption_in_transit_client_broker` is set to `TLS_PLAINTEXT` or `TLS` and `client_authentication_sasl_iam` is set to `true`"
  value       = try(module.msk_kafka_cluster.bootstrap_brokers_sasl_iam, null)
}

output "bootstrap_brokers_sasl_scram" {
  description = "One or more DNS names (or IP addresses) and SASL SCRAM port pairs. This attribute will have a value if `encryption_in_transit_client_broker` is set to `TLS_PLAINTEXT` or `TLS` and `client_authentication_sasl_scram` is set to `true`"
  value       = try(module.msk_kafka_cluster.bootstrap_brokers_sasl_scram, null)
}

output "msk_arn" {
  description = "Amazon Resource Name (ARN) of the MSK cluster"
  value       = try(module.msk_kafka_cluster.arn, null)
}

output "bootstrap_brokers_vpc_connectivity_sasl_iam" {
  description = "A string containing one or more DNS names (or IP addresses) and SASL IAM port pairs for VPC connectivity"
  value       = try(module.msk_kafka_cluster.bootstrap_brokers_vpc_connectivity_sasl_iam, null)
}