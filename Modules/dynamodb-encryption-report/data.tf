data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    sid       = "DefaultStatement"
    effect    = "Allow"
    resources = [aws_sns_topic.DynamoDBnotificationSNStopic.arn]
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
        "scheduler.amazonaws.com"
      ]
    }
  }
  statement {
    sid       = "AllowEventSchedulertoPosttoSNSTopic"
    effect    = "Allow"
    resources = [aws_sns_topic.DynamoDBnotificationSNStopic.arn]
    actions   = ["sns:Publish"]
    principals {
      type        = "Service"
      identifiers = ["scheduler.amazonaws.com"]
    }
  }
}
data "aws_iam_policy_document" "lambda_role_policy" {
  statement {
    sid       = "AllowSchedulerToInvokeLambda"
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "dynamodb:BatchGetItem",
      "dynamodb:Describe*",
      "dynamodb:List*",
      "dynamodb:GetItem",
      "dynamodb:GetResourcePolicy",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:PartiQLSelect",
      "dax:Describe*",
      "dax:List*",
      "dax:GetItem",
      "dax:BatchGetItem",
      "dax:Query",
      "dax:Scan"
    ]
  }
  statement {
    sid       = "AllowLambdaFunctionExecution"
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
  }
  statement {
    sid       = "AllowSNSPublish"
    effect    = "Allow"
    resources = [aws_sns_topic.DynamoDBnotificationSNStopic.arn]
    actions = [
      "sns:Publish"
    ]
  }
}
data "aws_iam_policy_document" "assume_role_lambda" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}
data "aws_iam_policy_document" "assume_role_scheduler" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["scheduler.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}
data "aws_iam_policy_document" "scheduler_role_policy" {
  statement {
    sid       = "AllowSchedulerToInvokeLambda"
    effect    = "Allow"
    resources = [aws_lambda_function.dynamodb_report_lambda.arn]
    actions   = ["lambda:InvokeFunction"]
  }
}
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lambda_function.zip"
}
data "aws_iam_policy" "lambda_execute_access" {
  arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"
}