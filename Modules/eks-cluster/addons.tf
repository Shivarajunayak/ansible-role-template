locals {
  karpenter_defaults = {
    chart_version             = ""
    override_policy_documents = []
    source_policy_documents   = []
    values = []
  }
}

module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = ">= 1.16.3" #ensure to update this to the latest/desired version"

  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn

  #eks_addons = var.eks_addons

  enable_aws_efs_csi_driver                    = try(var.enable_aws_efs_csi_driver, false)
  enable_aws_fsx_csi_driver                    = try(var.enable_aws_fsx_csi_driver, false)
  enable_argocd                                = try(var.enable_argocd, false)
  enable_argo_rollouts                         = try(var.enable_argo_rollouts, false)
  enable_argo_workflows                        = try(var.enable_argo_workflows, false)
  enable_aws_cloudwatch_metrics                = try(var.enable_aws_cloudwatch_metrics, false)
  enable_aws_privateca_issuer                  = try(var.enable_aws_privateca_issuer, false)
  enable_cert_manager                          = try(var.enable_cert_manager, false)
  enable_cluster_autoscaler                    = try(var.enable_cluster_autoscaler, false)
  enable_secrets_store_csi_driver              = try(var.enable_secrets_store_csi_driver, false)
  enable_secrets_store_csi_driver_provider_aws = try(var.enable_secrets_store_csi_driver_provider_aws, false)
  enable_kube_prometheus_stack                 = try(var.enable_kube_prometheus_stack, false)
  enable_external_dns                          = try(var.enable_external_dns, false)
  enable_external_secrets                      = try(var.enable_external_secrets, false)
  enable_gatekeeper                            = try(var.enable_gatekeeper, false)
  enable_aws_load_balancer_controller          = try(var.enable_aws_load_balancer_controller, false)
  enable_karpenter                             = try(var.enable_karpenter, false)
  enable_metrics_server                        = try(var.enable_metrics_server, false)
  enable_aws_for_fluentbit                     = try(var.enable_aws_for_fluentbit, false)

  kube_prometheus_stack          = var.enable_kube_prometheus_stack ? try(var.kube_prometheus_stack) : {}
  argocd                         = var.enable_argocd ? var.argocd : { 
    chart_version  = "5.55.0"
    set = []
    values = []
  }

  secrets_store_csi_driver       = var.enable_secrets_store_csi_driver ? try(var.secrets_store_csi_driver) : {}
  aws_for_fluentbit              = var.enable_aws_for_fluentbit ? try(var.aws_for_fluentbit) : {}
  aws_for_fluentbit_cw_log_group = var.enable_aws_for_fluentbit ? try(var.aws_for_fluentbit_cw_log_group) : {}
  aws_load_balancer_controller   = var.enable_aws_load_balancer_controller ? var.aws_load_balancer_controller : { 
    chart_version  = "1.7.1"
    set = []
    values = []
    source_policy_documents = []
    override_policy_documents = []
    role_permissions_boundary_arn = null
    role_policies = {}
    policy_statements = []

  }
  external_dns                   = var.enable_external_dns ? try(var.external_dns) : {}
  aws_cloudwatch_metrics         = var.enable_aws_cloudwatch_metrics ? try(var.aws_cloudwatch_metrics) : {}
  gatekeeper                     = var.enable_gatekeeper ? try(var.gatekeeper) : {}



  karpenter = var.enable_karpenter ? try(var.karpenter, {
    chart_version             = "0.37.0"
    override_policy_documents = []
    source_policy_documents   = []
    values = []
  }) : local.karpenter_defaults


    

  karpenter_node = var.enable_karpenter ? {
    create_iam_role       = false
    iam_role_arn          = aws_iam_role.karpenter_node_role[0].arn
    iam_role_name         = aws_iam_role.karpenter_node_role[0].name
    instance_profile_name = aws_iam_instance_profile.karpenter_instance_profile[0].name
    iam_role_additional_policies = [
      "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
      "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
    ]
  } : {
    create_iam_role       = false
    iam_role_arn          = ""
    iam_role_name         = ""
    instance_profile_name = ""
    iam_role_additional_policies = []
  }

  helm_releases = var.eks_addons_helm_releases

  tags = var.tags

}



module "eks_data_addons" {
  source = "aws-ia/eks-data-addons/aws"
  # version = "~> 1.0" # ensure to update this to the latest/desired version

  oidc_provider_arn = module.eks.oidc_provider_arn
  enable_kubecost   = try(var.enable_kubecost, false)

  kubecost_helm_config = try(var.kubecost_helm_config, null)


}

resource "random_string" "random" {
  length  = 4
  special = false
}


data "aws_secretsmanager_secret_version" "argocd_secret" {
  count     = var.enable_argocd ? 1 : 0
  secret_id = var.argocd_configs.azure_token_secret_arn
}

resource "kubernetes_secret" "argocd_secret" {
  count = var.enable_argocd ? 1 : 0
  metadata {
    name      = "azure-token"
    namespace = "argocd"
  }

  data = {
    token = data.aws_secretsmanager_secret_version.argocd_secret[0].secret_string
  }
}



## Karpenter ##

#### New nodepool logic

# Always create the default NodePool (Remove line 145 till 193)
resource "kubectl_manifest" "karpenter_nodepool" {
  count = var.enable_karpenter ? 1 : 0
  yaml_body = templatefile("${path.module}/configs/karpenter_nodepool.yml", {
    nodepool_name = "default"
    nodeclass_name = "default"
    karpenter_cpu_limit             = try(var.karpenter_configs.cpu_limit, "1000")
    karpenter_memory_limit          = try(var.karpenter_configs.memory_limit, "1000Gi")
    karpenter_instance_architecture = jsonencode(try(var.karpenter_configs.karpenter_instance_architecture, ["amd64"]))
    karpenter_instance_category     = jsonencode(try(var.karpenter_configs.karpenter_instance_category, ["c", "m", "r"]))
    karpenter_instance_family       = jsonencode(try(var.karpenter_configs.karpenter_instance_family, ["m5","m5d","c5","c5d","c4","r4"]))
    karpenter_instance_type         = jsonencode(try(var.karpenter_configs.karpenter_instance_type, ["m5.large","m5a.large","c5.large","c5d.large"]))
    karpenter_instance_azs          = jsonencode(try(var.karpenter_configs.karpenter_instance_azs, ["ap-south-1a", "ap-south-1b"]))
    karpenter_capacity_type         = jsonencode(try(var.karpenter_configs.karpenter_capacity_type, ["on-demand"]))
    karpenter_consolidation_policy  = jsonencode(try(var.karpenter_configs.karpenter_consolidation_policy, "WhenEmptyOrUnderutilized"))
    karpenter_consolidate_after     = jsonencode(try(var.karpenter_configs.karpenter_consolidate_after, "1m"))
    karpenter_labels                = jsonencode(try(var.karpenter_configs.karpenter_labels, { intent = "apps" }))
    karpenter_max_nodes_disruption_allowed_when_underutilized_in_schedule = jsonencode(try(var.karpenter_configs.karpenter_max_nodes_disruption_allowed_when_underutilized_in_schedule, "0"))
    karpenter_disruption_allowed_when_underutilized_schedule_start = jsonencode(try(var.karpenter_configs.karpenter_disruption_allowed_when_underutilized_schedule_start, "3 15 * * mon-fri"))
    karpenter_disruption_allowed_when_underutilized_schedule_duration = jsonencode(try(var.karpenter_configs.karpenter_disruption_allowed_when_underutilized_schedule_duration, "8h"))
    karpenter_nodes_disruption_allowed_when_empty_all_the_times = jsonencode(try(var.karpenter_configs.karpenter_nodes_disruption_allowed_when_empty_all_the_times, "100%"))
    karpenter_nodes_disruption_allowed_at_any_time_of_the_day = jsonencode(try(var.karpenter_configs.karpenter_nodes_disruption_allowed_at_any_time_of_the_day, "10%"))
  })

  depends_on = [
    module.eks_blueprints_addons
  ]
}

# Always create the default NodeClass
resource "kubectl_manifest" "karpenter_nodeclass" {
  count = var.enable_karpenter ? 1 : 0

  yaml_body = templatefile("${path.module}/configs/karpenter_nodeclass.yml", {
    nodeclass_name = "default"
    karpenter_node_instance_role      = aws_iam_role.karpenter_node_role[0].name
    karpenter_shared_subnet_tag_regex = try(var.karpenter_configs.karpenter_shared_subnet_tag_regex, "*shared*")
    karpenter_back_subnet_tag_regex   = try(var.karpenter_configs.karpenter_back_subnet_tag_regex, "*back*")
    karpenter_node_ami_family         = try(var.karpenter_configs.karpenter_node_ami_family, "AL2")
    karpenter_node_ami                = try(var.karpenter_configs.karpenter_node_ami, "al2023@v20240703")
    cluster_name                      = module.eks.cluster_name
    karpenter_userdata                = indent(4, file("${path.module}/configs/custom_userdata.tmpl"))
    karpenter_node_max_pods           = try(var.karpenter_configs.karpenter_node_max_pods, 44)
    karpenter_node_root_vol_size      = try(var.karpenter_configs.karpenter_node_root_vol_size, "20Gi")
  })

  depends_on = [
    module.eks_blueprints_addons
  ]
}

# Create additional custom NodePools
resource "kubectl_manifest" "additional_karpenter_nodepool" {
  for_each = var.enable_karpenter ? { for idx, pool in var.karpenter_nodepools : pool.name => pool } : {}
  
  yaml_body = templatefile("${path.module}/configs/karpenter_nodepool.yml", {
    nodepool_name = each.value.name
    nodeclass_name = each.value.nodeclass_name != null ? each.value.nodeclass_name : "${each.value.name}-class"
    karpenter_cpu_limit             = each.value.cpu_limit
    karpenter_memory_limit          = each.value.memory_limit
    karpenter_instance_architecture = jsonencode(each.value.instance_architecture)
    karpenter_instance_category     = jsonencode(each.value.instance_category)
    karpenter_instance_family       = jsonencode(each.value.instance_family)
    karpenter_instance_type         = jsonencode(each.value.instance_type)
    karpenter_instance_azs          = jsonencode(each.value.instance_azs)
    karpenter_capacity_type         = jsonencode(each.value.capacity_type)
    karpenter_consolidation_policy  = jsonencode(each.value.consolidation_policy)
    karpenter_consolidate_after     = jsonencode(each.value.consolidate_after)
    karpenter_labels                = jsonencode(each.value.labels)
    karpenter_max_nodes_disruption_allowed_when_underutilized_in_schedule = jsonencode(each.value.max_nodes_disruption_allowed_when_underutilized_in_schedule)
    karpenter_disruption_allowed_when_underutilized_schedule_start = jsonencode(each.value.disruption_allowed_when_underutilized_schedule_start)
    karpenter_disruption_allowed_when_underutilized_schedule_duration = jsonencode(each.value.disruption_allowed_when_underutilized_schedule_duration)
    karpenter_nodes_disruption_allowed_when_empty_all_the_times = jsonencode(each.value.nodes_disruption_allowed_when_empty_all_the_times)
    karpenter_nodes_disruption_allowed_at_any_time_of_the_day = jsonencode(each.value.nodes_disruption_allowed_at_any_time_of_the_day)
  })

  depends_on = [
    module.eks_blueprints_addons,
    kubectl_manifest.karpenter_nodepool,
    kubectl_manifest.karpenter_nodeclass
  ]
}

# Create additional custom NodeClasses
resource "kubectl_manifest" "additional_karpenter_nodeclass" {
  for_each = var.enable_karpenter ? { for idx, pool in var.karpenter_nodepools : pool.name => pool } : {}

  yaml_body = templatefile("${path.module}/configs/karpenter_nodeclass.yml", {
    nodeclass_name = each.value.nodeclass_name != null ? each.value.nodeclass_name : "${each.value.name}-class"
    karpenter_node_instance_role      = aws_iam_role.karpenter_node_role[0].name
    karpenter_shared_subnet_tag_regex = each.value.shared_subnet_tag_regex
    karpenter_back_subnet_tag_regex   = each.value.back_subnet_tag_regex
    karpenter_node_ami_family         = each.value.node_ami_family
    karpenter_node_ami                = each.value.node_ami
    cluster_name                      = module.eks.cluster_name
    karpenter_userdata                = indent(4, file("${path.module}/configs/custom_userdata.tmpl"))
    karpenter_node_max_pods           = each.value.node_max_pods
    karpenter_node_root_vol_size      = each.value.node_root_vol_size
  })

  depends_on = [
    module.eks_blueprints_addons,
    kubectl_manifest.karpenter_nodepool,    # Remove this as well
    kubectl_manifest.karpenter_nodeclass    # Remove this as well
  ]
}

#########################################################

resource "aws_iam_role" "karpenter_node_role" {
  count = var.enable_karpenter ? 1 : 0
  # name  = "eks-${var.environment}-karpenter-node-role"
  name = try("hmcl-cv-${var.environment}-${var.karpenter_configs.role_name_prefix}-${lookup(local.regions, data.aws_region.current.name)}-karpenter-node-role-${random_string.random.result}",
  "hmcl-cv-${var.environment}-${lookup(local.regions, data.aws_region.current.name)}-karpenter-node-role-${random_string.random.result}")
  #REPLACE HERE
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "karpenter_node_role_attachment" {
  for_each   = var.enable_karpenter ? { for i, val in local.policies : i => val } : {}
  role       = aws_iam_role.karpenter_node_role[0].name
  policy_arn = each.value
}

resource "aws_iam_instance_profile" "karpenter_instance_profile" {
  count = var.enable_karpenter ? 1 : 0
  name  = "hmcl-cv-${var.environment}-${lookup(local.regions, data.aws_region.current.name)}-karpenter-node-${random_string.random.result}"
  path  = var.role_policy_path
  ##REPLACE HERE
  role = aws_iam_role.karpenter_node_role[0].name
}







# resource "kubectl_manifest" "local_volume_node_cleanup_controller" {
#   count     = try(var.enable_volume_cleanup, false) ? 1 : 0
#   yaml_body = file("${path.module}/configs/local_volume_node_cleanup_controller.yaml")
# }

# data "kubectl_path_documents" "local_volume_node_cleanup_controller_rbac" {
#   pattern = "${path.module}/configs/local_volume_node_cleanup_controller_rbac.yaml"
# }

# resource "kubectl_manifest" "local_volume_node_cleanup_controller_rbac" {
#   for_each  = try(var.enable_volume_cleanup, false) ? toset(data.kubectl_path_documents.local_volume_node_cleanup_controller_rbac.documents) : toset([])
#   yaml_body = each.value
# }
