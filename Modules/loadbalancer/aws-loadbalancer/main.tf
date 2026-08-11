resource "aws_lb" "load_balancer" {
  name                             = var.lb_name
  internal                         = var.internal
  load_balancer_type               = var.load_balancer_type
  subnets                          = var.subnets
  security_groups                  = var.security_groups
  enable_http2                     = var.enable_http2
  enable_deletion_protection       = var.delete_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  tags                             = var.tags
}

resource "aws_lb_target_group" "target_group" {
  for_each         = var.target_groups
  name             = each.value.name
  port             = each.value.port
  protocol         = each.value.protocol
  protocol_version = try(each.value.protocol_version, null)
  vpc_id           = each.value.vpc_id
  target_type      = each.value.target_type
}

resource "aws_lb_listener" "listener_80" {

  count             = var.load_balancer_type == "application" ? 1 : 0
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "listener" {
  for_each          = var.listeners
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = each.value.port
  protocol          = each.value.protocol
  certificate_arn   = try(each.value.certificate_arn, null)

  default_action {
    type             = try(each.value.action_type, "forward")
    target_group_arn = aws_lb_target_group.target_group[each.value.target_group].arn
  }
}
