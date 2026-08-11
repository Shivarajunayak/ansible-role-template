data "aws_secretsmanager_secret" "opensearch_secret" {
   name = var.opensearch_secret_name
 }

data "aws_secretsmanager_secret_version" "opensearch_secret_version" {
   secret_id = data.aws_secretsmanager_secret.opensearch_secret.id
 }

# To decode the JSON secret_string and extract the values:
locals {
   secret = jsondecode(data.aws_secretsmanager_secret_version.opensearch_secret_version.secret_string)
 }


provider "opensearch" {
  url               = var.opensearch_endpoint
  healthcheck       = "false"
  aws_region        = var.aws_region
  #aws_assume_role_arn = "arn:aws:iam::905418263290:role/hmcl-terraform-assume-role"
  version_ping_timeout = var.version_ping_timeout
  username          = local.secret["opensearch.net.http.auth.user"]
  password          = local.secret["opensearch.net.http.auth.pass"]
  sign_aws_requests = var.sign_aws_requests
}

resource "opensearch_index" "index" {
  for_each = { for idx in var.indexes : idx.name => idx }
  name               = try(each.value.name, null)
  number_of_replicas = try(each.value.number_of_replicas, null)
  number_of_shards   = try(each.value.number_of_shards, null)
  aliases = jsonencode(try(each.value.aliases, null))
  mappings = jsonencode({
    "properties": try(each.value.mappings, null)
  })
}