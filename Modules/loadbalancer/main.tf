################################################################################
# NLB
################################################################################

module "network_load_balancers" {

  for_each = var.network_load_balancers

  source = "./aws-loadbalancer"

  lb_name            = each.value.lb_name
  internal           = try(each.value.internal, true)
  enable_http2       = try(each.value.enable_http2, true)
  load_balancer_type = try(each.value.load_balancer_type, "network")
  subnets            = each.value.subnets
  delete_protection  = try(each.value.delete_protection, false)
  tags               = try(each.value.tags, {})
  target_groups      = try(each.value.target_groups, {})
  security_groups    = try(each.value.security_groups, [])
  listeners          = try(each.value.listeners, {})
}
