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


resource "opensearch_user" "readonly_user" {
  username = var.readonly_user
  password = var.readonly_user_password
  backend_roles = ["readonly_role"]
}

resource "opensearch_role" "readonly_role" {
  role_name = "readonly_role"

  cluster_permissions = ["cluster_composite_ops_ro", "cluster:admin/opendistro/ism/policy/search", 
                        "cluster:monitor/health", "cluster:monitor/state"]  # Read-only operations
  index_permissions {
    index_patterns = ["*"]  # Access all indices
    allowed_actions = ["read", "indices:admin/get", "indices:monitor/settings/get", "indices:monitor/stats", "indices:admin/aliases/get", "indices:admin/data_stream/get", "indices:monitor/data_stream/stats"]  # Read-only actions
  }
  tenant_permissions {
    tenant_patterns = ["*"] # Matches all tenants
    allowed_actions = [
      "kibana_all_read", # Read access for Kibana tenants
    ]
  }
}
resource "opensearch_roles_mapping" "readonly_mapping" {
  role_name = opensearch_role.readonly_role.role_name
  users     = [opensearch_user.readonly_user.username]
}