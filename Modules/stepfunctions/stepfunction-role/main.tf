# Create a new IAM role for AWS stepfunction
resource "aws_iam_role" "stepfunction_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = [
          "states.amazonaws.com",
          "iotfleetwise.amazonaws.com"
          ]
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}
# Attach AWS stepfunction service role policy to the newly created role

resource "aws_iam_role_policy_attachment" "stepfunction_policy_attachment" {
  for_each = toset(var.managed_policies)

  role       = aws_iam_role.stepfunction_role.name
  policy_arn = each.value
}

# Attach an additional custom policy to the role (example policy)
resource "aws_iam_policy" "custom_policy" {
  name        = var.iam_policy_name
  description = "Custom policy for stepfunction"
  policy      = var.custom_policy_json
}
# Attach the custom policy to the role
resource "aws_iam_role_policy_attachment" "custom_policy_attachment" {
  role       = aws_iam_role.stepfunction_role.name
  policy_arn = aws_iam_policy.custom_policy.arn
}
