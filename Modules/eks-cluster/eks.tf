################################################################################
# EKS Cluster
################################################################################


module "eks" {

  depends_on = [aws_iam_role.argocd_spoke_role]

  source = "./modules/aws-eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  cluster_addons                  = var.cluster_addons

  create_iam_role                         = var.create_iam_role
  iam_role_arn                            = var.iam_role_arn
  vpc_id                                  = var.vpc_id
  subnet_ids                              = var.subnet_ids
  control_plane_subnet_ids                = var.control_plane_subnet_ids
  cluster_security_group_additional_rules = var.cluster_security_group_additional_rules

  cluster_enabled_log_types               = var.cluster_enabled_log_types
  cloudwatch_log_group_retention_in_days  = var.cloudwatch_log_group_retention_in_days
  cluster_upgrade_policy                  = var.cluster_upgrade_policy


  # Self Managed Node Group(s)
  self_managed_node_group_defaults = var.self_managed_node_group_defaults

  self_managed_node_groups = var.self_managed_node_groups

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = var.eks_managed_node_group_defaults

  eks_managed_node_groups = local.managed_node_group_configs

  # Fargate Profile(s)
  fargate_profile_defaults = var.fargate_profile_defaults
  fargate_profiles         = var.fargate_profiles

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions
  authentication_mode                      = var.authentication_mode

  access_entries = var.access_entries

  create_kms_key            = var.create_kms_key
  cluster_encryption_config = var.cluster_encryption_config

  node_security_group_additional_rules = var.node_security_group_additional_rules

  iam_role_path = var.role_policy_path
  #REPLACE HERE
  cluster_encryption_policy_path = var.role_policy_path

  tags = var.tags
}


################################################################################
# aws-auth ConfigMap
################################################################################


module "aws_auth" {
  source = "./modules/aws-eks//modules/aws-auth"

  manage_aws_auth_configmap = true

  aws_auth_roles = var.enable_karpenter ? concat(var.aws_auth_roles,
    [
      {
        rolearn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${aws_iam_role.karpenter_node_role[0].name}"
        username = "system:node:{{EC2PrivateDNSName}}"
        groups = [
          "system:bootstrappers",
          "system:nodes",
        ]
      }
    ]
  ) : var.aws_auth_roles
}

################################################################################
# Custom CNI Config
################################################################################


resource "kubectl_manifest" "eni_config" {

  for_each = try(var.use_pod_secondary_cidr, false) ? zipmap(var.pod_secondary_cidr_azs, var.pod_secondary_cidr_subnets) : {}

  yaml_body = yamlencode({
    apiVersion = "crd.k8s.amazonaws.com/v1alpha1"
    kind       = "ENIConfig"
    metadata = {
      name = each.key
    }
    spec = {
      subnet = each.value
    }
  })

  depends_on = [
    module.eks,
  ]
}


################################################################################
# IRSA
################################################################################


module "irsa" {
  for_each              = { for i, v in var.irsa_configs : i => v }
  source                = "./modules/irsa"
  role_name             = each.value.app_name
  policy                = each.value.policy
  eks_oidc_provider_arn = module.eks.oidc_provider_arn
  environment           = var.environment
  role_policy_path      = var.role_policy_path
}



################################################################################
# ArgoCD Spoke Role
################################################################################


resource "aws_iam_role" "argocd_spoke_role" {

  count = var.register_as_spoke ? 1 : 0

  name = "${var.cluster_name}-${lookup(local.regions, data.aws_region.current.name)}-argocd-spoke-role"
  path = var.role_policy_path
  #REPLACE HERE
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          AWS = var.argocd_controller_role_arn
        }
      }
    ]
  })
}


################################################################################
# ArgoCD Spoke Cluster Secret in Shared Cluster
################################################################################

resource "kubernetes_secret" "spoke_cluster_secret" {

  count = var.register_as_spoke ? 1 : 0

  provider = kubernetes.mgmt

  metadata {
    name = "hmcl-cv-argo-spoke-${data.aws_caller_identity.current.account_id}-${lookup(local.regions, data.aws_region.current.name)}-${module.eks.cluster_name}"
    labels = {
      "argocd.argoproj.io/secret-type" = "cluster"
    }
    namespace = "argocd"
  }

  data = {
    config = jsonencode(
      {
        awsAuthConfig = {
          clusterName = module.eks.cluster_name
          roleARN     = aws_iam_role.argocd_spoke_role[0].arn
        }
        tlsClientConfig = {
          caData = module.eks.cluster_certificate_authority_data
        }
      }
    )
    name   = "hmcl-cv-argo-spoke-${data.aws_caller_identity.current.account_id}-${lookup(local.regions, data.aws_region.current.name)}-${module.eks.cluster_name}"
    server = module.eks.cluster_endpoint
  }
}
