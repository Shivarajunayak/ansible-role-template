########################## Delete KMS Key Notification #############################
resource "aws_sns_topic" "DynamoDBnotificationSNStopic" {
  name = var.sns_topic_name
}
resource "aws_sns_topic_policy" "snstopicpolicy" {
  arn    = aws_sns_topic.DynamoDBnotificationSNStopic.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}
resource "aws_sns_topic_subscription" "dynamoDB_email_notification" {
  topic_arn = aws_sns_topic.DynamoDBnotificationSNStopic.arn
  protocol  = "email"
  endpoint  = var.security_notification_emailID
}
########################## Rotate KMS Key Notification #############################
resource "aws_scheduler_schedule" "eventbridge_scheduler" {
  name = var.eventbridge_scheduler_name
  flexible_time_window {
    mode = "OFF"
  }
  schedule_expression = "rate(30 days)"
  target {
    arn      = aws_lambda_function.dynamodb_report_lambda.arn
    role_arn = aws_iam_role.iam_role_for_scheduler.arn
  }
}
########################## IAM Policy for Event Scheduler #############################
resource "aws_iam_policy" "scheduler_policy" {
  name        = var.event_scheduler_iam_role_name
  description = "Event Scheduler Policy"
  policy      = data.aws_iam_policy_document.scheduler_role_policy.json
}
########################## IAM Role Policy Attachment #############################
resource "aws_iam_role_policy_attachment" "scheduler_policy_attach" {
  role       = aws_iam_role.iam_role_for_scheduler.name
  policy_arn = aws_iam_policy.scheduler_policy.arn
}
########################## IAM Role for Event Scheduler #############################
resource "aws_iam_role" "iam_role_for_scheduler" {
  name               = var.event_scheduler_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_scheduler.json
}
########################## IAM Policy for Event Scheduler #############################
resource "aws_iam_policy" "lambda_policy" {
  name        = var.lambda_iam_role_name
  description = "Lambda Function Policy"
  policy      = data.aws_iam_policy_document.lambda_role_policy.json
}
########################## IAM Role Policy Attachment #############################
resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.iam_role_for_lambda.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}
########################## IAM Role Policy Attachment #############################
resource "aws_iam_role_policy_attachment" "lambda_policy_attach_2" {
  role       = aws_iam_role.iam_role_for_lambda.name
  policy_arn = data.aws_iam_policy.lambda_execute_access.arn
}
########################## IAM Role for Lambda #############################
resource "aws_iam_role" "iam_role_for_lambda" {
  name               = var.lambda_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
}
########################## Lambda Function #############################
resource "aws_lambda_function" "dynamodb_report_lambda" {
  depends_on       = [aws_iam_role.iam_role_for_lambda]
  description      = "Function generate DynamoDB encryption report"
  filename         = "lambda_function.zip"
  function_name    = var.lambda_function_name
  role             = aws_iam_role.iam_role_for_lambda.arn
  handler          = "lambda_function.lambda_handler"
  memory_size      = 128
  timeout          = 300
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.11"
  ephemeral_storage {
    size = 512 # Min 512 MB and the Max 10240 MB
  }
  environment {
    variables = {
      SNS_topic_ARN = "${aws_sns_topic.DynamoDBnotificationSNStopic.arn}"
    }
  }
}