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
data "aws_iam_policy_document" "assume_role_firehose" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [data.aws_caller_identity.current.id]
    }
  }
}

data "aws_iam_policy_document" "assume_role_events" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda.py"
  output_path = "lambda_function.zip"
}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}