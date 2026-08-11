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

resource "opensearch_index_template" "template" {
  count = var.enable_template ? 1 : 0
  name  = try(var.template_name, null)
  body  = try(var.body, null)
}
resource "opensearch_data_stream" "foo" {
  name       = try(var.data_stream_name, null)
  depends_on = [opensearch_index_template.template]
}
