# resource "aws_organizations_organization" "example" {
#   aws_service_access_principals = ["guardduty.amazonaws.com"]
#   feature_set                   = "ALL"
# }
resource "aws_guardduty_detector" "enableguardduty" {}

resource "time_sleep" "wait_guardduty_enable" {
  create_duration = "10s"
  depends_on      = [aws_guardduty_detector.enableguardduty]
}
resource "aws_guardduty_organization_admin_account" "delegatedadmin" {
  depends_on       = [aws_guardduty_detector.enableguardduty]
  admin_account_id = var.guardduty_admin_account
}
resource "aws_organizations_resource_policy" "guarddutymgmt" {
  content = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DelegatingNecessaryDescribeListActions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.id}:root"
      },
      "Action": [
        "organizations:DescribeOrganization",
        "organizations:DescribeOrganizationalUnit",
        "organizations:DescribeAccount",
        "organizations:DescribePolicy",
        "organizations:DescribeEffectivePolicy",
        "organizations:ListRoots",
        "organizations:ListOrganizationalUnitsForParent",
        "organizations:ListParents",
        "organizations:ListChildren",
        "organizations:ListAccounts",
        "organizations:ListAccountsForParent",
        "organizations:ListPolicies",
        "organizations:ListPoliciesForTarget",
        "organizations:ListTargetsForPolicy",
        "organizations:ListTagsForResource"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}