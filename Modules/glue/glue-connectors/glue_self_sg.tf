################################################################################
# Glue self sg
################################################################################

resource "aws_security_group" "glue_self_sg" {
  name        = "${var.msk_connection_name}-self-sg"
  description = "Security group for Glue"
  vpc_id      = var.etl_vpc_id
  tags = merge(
    var.tags,
    {
      Name = "glue-self-sg"
  })
}

resource "aws_security_group_rule" "allow_self_ingress" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  security_group_id        = aws_security_group.glue_self_sg.id
  source_security_group_id = aws_security_group.glue_self_sg.id
  description              = "Allow traffic from within the same security group"
}

resource "aws_security_group_rule" "allow_self_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.glue_self_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic"
}
