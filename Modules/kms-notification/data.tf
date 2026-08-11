data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "sns_policy" {
  statement {
    sid       = "DefaultStatement"
    effect    = "Allow"
    resources = [aws_sns_topic.kms_notification_snstopic.arn]
    actions = [
      "SNS:GetTopicAttributes",
      "SNS:SetTopicAttributes",
      "SNS:AddPermission",
      "SNS:RemovePermission",
      "SNS:DeleteTopic",
      "SNS:Subscribe",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
      "SNS:Receive",
    ]
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"
      values   = [data.aws_caller_identity.current.id]
    }
    principals {
      type = "Service"
      identifiers = [
        "events.amazonaws.com",
        "cloudwatch.amazonaws.com",
        "config.amazonaws.com",
        "cloudformation.amazonaws.com",
      ]
    }
  }
  statement {
    sid       = "AllowEventRuletoPosttoSNSTopic"
    effect    = "Allow"
    resources = [aws_sns_topic.kms_notification_snstopic.arn]
    actions   = ["sns:Publish"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
}