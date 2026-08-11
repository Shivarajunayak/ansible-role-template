output "cluster_arn" {
  description = "Cluster ARN"
  value       = module.aurora.cluster_arn
}

output "cluster_id" {
  description = "Cluster ID"
  value       = module.aurora.cluster_id
}

output "cluster_reader_endpoint" {
  description = "Reader endpoint for the cluster"
  value       = module.aurora.cluster_reader_endpoint
}


output "cluster_writer_endpoint" {
  description = "Writer endpoint for the cluster"
  value       = module.aurora.cluster_endpoint
}

output "cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = module.aurora.cluster_database_name
}

