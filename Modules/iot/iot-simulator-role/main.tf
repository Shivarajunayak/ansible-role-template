resource "aws_iam_role" "iot_simulator_role" {
  name               = var.simulator_role_name
  assume_role_policy = var.assume_role_policy_action
  tags               = var.tags
}

resource "aws_iam_policy" "custom_policy" {
  name        = var.simulator_policy_name
  description = "Custom policy for Simulator role"
  policy      = var.custom_policy_json
}

resource "aws_iam_role_policy_attachment" "custom_policy_attachment" {
  role       = aws_iam_role.iot_simulator_role.name
  policy_arn = aws_iam_policy.custom_policy.arn
}
