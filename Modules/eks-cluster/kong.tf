data "aws_secretsmanager_secret" "kong_secret" {
  count = var.is_kong_cluster && var.kong_secret_name != "" ? 1 : 0
  name  = var.kong_secret_name
}

data "aws_secretsmanager_secret_version" "kong_secret_version" {
  count     = var.is_kong_cluster && var.kong_secret_name != "" ? 1 : 0
  secret_id = data.aws_secretsmanager_secret.kong_secret[0].id
}

# To decode the JSON secret_string and extract the values:
locals {
  secret = var.is_kong_cluster && var.kong_secret_name != "" ? jsondecode(data.aws_secretsmanager_secret_version.kong_secret_version[0].secret_string) : { "hello" = "world" }
}

resource "kubernetes_secret" "kong_secret" {
  count = var.is_kong_cluster && var.kong_secret_name != "" ? 1 : 0
  metadata {
    name      = "kong-cluster-cert"
    namespace = "kong"
  }

  data = {
    "tls.crt" = local.secret["crt"]
    "tls.key" = local.secret["key"]
  }
  type = "kubernetes.io/tls"
}

#########################################################




data "aws_secretsmanager_secret" "kong_qa_secret" {
  count = var.is_kong_cluster && var.kong_qa_secret_name != "" ? 1 : 0
  name  = var.kong_qa_secret_name
}

data "aws_secretsmanager_secret_version" "kong_qa_secret_version" {
  count     = var.is_kong_cluster && var.kong_qa_secret_name != "" ? 1 : 0
  secret_id = data.aws_secretsmanager_secret.kong_qa_secret[0].id
}

# To decode the JSON secret_string and extract the values:
locals {
  qasecret = var.is_kong_cluster && var.kong_qa_secret_name != "" ? jsondecode(data.aws_secretsmanager_secret_version.kong_qa_secret_version[0].secret_string) : { "hello" = "world" }
}

resource "kubernetes_secret" "kong_qa_secret" {
  count = var.is_kong_cluster && var.kong_qa_secret_name != "" ? 1 : 0
  metadata {
    name      = "kong-cluster-cert"
    namespace = "kong-qa"
  }

  data = {
    "tls.crt" = local.qasecret["crt"]
    "tls.key" = local.qasecret["key"]
  }
  type = "kubernetes.io/tls"
}


########################################################


data "aws_secretsmanager_secret" "kong_uat_secret" {
  count = var.is_kong_cluster && var.kong_uat_secret_name != "" ? 1 : 0
  name  = var.kong_uat_secret_name
}

data "aws_secretsmanager_secret_version" "kong_uat_secret_version" {
  count     = var.is_kong_cluster && var.kong_uat_secret_name != "" ? 1 : 0
  secret_id = data.aws_secretsmanager_secret.kong_uat_secret[0].id
}

# To decode the JSON secret_string and extract the values:
locals {
  uatsecret = var.is_kong_cluster && var.kong_uat_secret_name != "" ? jsondecode(data.aws_secretsmanager_secret_version.kong_uat_secret_version[0].secret_string) : { "hello" = "world" }
}

resource "kubernetes_secret" "kong_uat_secret" {
  count = var.is_kong_cluster && var.kong_uat_secret_name != "" ? 1 : 0
  metadata {
    name      = "kong-cluster-cert"
    namespace = "kong-uat"
  }

  data = {
    "tls.crt" = local.uatsecret["crt"]
    "tls.key" = local.uatsecret["key"]
  }
  type = "kubernetes.io/tls"
}


###########################################

data "aws_secretsmanager_secret" "kong_prod_secret" {
  count = var.is_kong_cluster && var.kong_prod_secret_name != "" ? 1 : 0
  name  = var.kong_prod_secret_name
}

data "aws_secretsmanager_secret_version" "kong_prod_secret_version" {
  count     = var.is_kong_cluster && var.kong_prod_secret_name != "" ? 1 : 0
  secret_id = data.aws_secretsmanager_secret.kong_prod_secret[0].id
}

# To decode the JSON secret_string and extract the values:
locals {
  prodsecret = var.is_kong_cluster && var.kong_prod_secret_name != "" ? jsondecode(data.aws_secretsmanager_secret_version.kong_prod_secret_version[0].secret_string) : { "hello" = "world" }
}

resource "kubernetes_secret" "kong_prod_secret" {
  count = var.is_kong_cluster && var.kong_prod_secret_name != "" ? 1 : 0
  metadata {
    name      = "kong-cluster-cert"
    namespace = "kong-prod"
  }

  data = {
    "tls.crt" = local.prodsecret["crt"]
    "tls.key" = local.prodsecret["key"]
  }
  type = "kubernetes.io/tls"
}

###########################################

data "aws_secretsmanager_secret" "kong_dev_new_secret" {
  count = var.is_kong_cluster && var.kong_dev_new_secret_name != "" ? 1 : 0
  name  = var.kong_dev_new_secret_name
}

data "aws_secretsmanager_secret_version" "kong_dev_new_secret_version" {
  count     = var.is_kong_cluster && var.kong_dev_new_secret_name != "" ? 1 : 0
  secret_id = data.aws_secretsmanager_secret.kong_dev_new_secret[0].id
}

# To decode the JSON secret_string and extract the values:
locals {
  devnewsecret = var.is_kong_cluster && var.kong_dev_new_secret_name != "" ? jsondecode(data.aws_secretsmanager_secret_version.kong_dev_new_secret_version[0].secret_string) : { "hello" = "world" }
}

resource "kubernetes_secret" "kong_dev_new_secret" {
  count = var.is_kong_cluster && var.kong_dev_new_secret_name != "" ? 1 : 0
  metadata {
    name      = "kong-cluster-cert"
    namespace = "kong-dev-new"
  }

  data = {
    "tls.crt" = local.devnewsecret["crt"]
    "tls.key" = local.devnewsecret["key"]
  }
  type = "kubernetes.io/tls"
}

###########################################

data "aws_secretsmanager_secret" "kong_qa_new_secret" {
  count = var.is_kong_cluster && var.kong_qa_new_secret_name != "" ? 1 : 0
  name  = var.kong_qa_new_secret_name
}

data "aws_secretsmanager_secret_version" "kong_qa_new_secret_version" {
  count     = var.is_kong_cluster && var.kong_qa_new_secret_name != "" ? 1 : 0
  secret_id = data.aws_secretsmanager_secret.kong_qa_new_secret[0].id
}

# To decode the JSON secret_string and extract the values:
locals {
  qanewsecret = var.is_kong_cluster && var.kong_qa_new_secret_name != "" ? jsondecode(data.aws_secretsmanager_secret_version.kong_qa_new_secret_version[0].secret_string) : { "hello" = "world" }
}

resource "kubernetes_secret" "kong_qa_new_secret" {
  count = var.is_kong_cluster && var.kong_qa_new_secret_name != "" ? 1 : 0
  metadata {
    name      = "kong-cluster-cert"
    namespace = "kong-qa-new"
  }

  data = {
    "tls.crt" = local.qanewsecret["crt"]
    "tls.key" = local.qanewsecret["key"]
  }
  type = "kubernetes.io/tls"
}
