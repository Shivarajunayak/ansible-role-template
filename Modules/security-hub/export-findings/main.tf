########################## IAM Role for Lambda #############################
resource "aws_iam_policy" "iam_policy_for_lambda" {
  name = "${var.lambda_function_iam_role_name}-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowSecurityHubFindings",
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject"
        ],
        "Resource" : ["${var.sec_hub_findings_bucket_arn}/*"]
      },
      {
        "Sid" : "AllowDecryptFindings",
        "Effect" : "Allow",
        "Action" : [
          "kms:Decrypt",
          "kms:GenerateDataKey*"
        ],
        "Resource" : ["${var.s3_bucket_kms_key_arn}"]
      }      
    ]
  })
}
resource "aws_iam_role" "iam_for_lambda" {
  name                = var.lambda_function_iam_role_name
  assume_role_policy  = data.aws_iam_policy_document.assume_role_lambda.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/AWSLambdaExecute", aws_iam_policy.iam_policy_for_lambda.arn]
}

resource "aws_lambda_permission" "allow_s3_bucket" {
  depends_on     = [aws_lambda_function.export_security_hub_lambda]
  statement_id   = "AllowExecutionFromS3Bucket"
  action         = "lambda:InvokeFunction"
  function_name  = var.lambda_function_name
  principal      = "s3.amazonaws.com"
  source_account = var.logging_account_number
}
########################## Lambda Function #############################
resource "aws_lambda_function" "export_security_hub_lambda" {
  depends_on       = [aws_iam_role.iam_for_lambda]
  description      = "Function sorts findings by AWS account id/product/region"
  filename         = "lambda_function.zip"
  function_name    = var.lambda_function_name
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "lambda.handler"
  memory_size      = 128
  timeout          = 300
  reserved_concurrent_executions = 2
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = "python3.8"
  ephemeral_storage {
    size = 512 # Min 512 MB and the Max 10240 MB
  }
}
########################## IAM Role for Security Hub Log Delivery #############################
resource "aws_iam_policy" "security_hub_log_delivery_policy" {
  name = "${var.security_hub_log_delivery_iam_role_name}-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowSecurityHubLogDelivery",
        "Effect" : "Allow",
        "Action" : [
          "firehose:PutRecord",
          "firehose:PutRecordBatch"
        ],
        "Resource" : [aws_kinesis_firehose_delivery_stream.kinesis_delivery_stream.arn]
      }
    ]
  })
}
resource "aws_iam_role" "security_hub_log_delivery_role" {
  name                = var.security_hub_log_delivery_iam_role_name
  assume_role_policy  = data.aws_iam_policy_document.assume_role_events.json
  managed_policy_arns = [aws_iam_policy.security_hub_log_delivery_policy.arn]
}
########################## IAM Role for Kinesis Firehose #############################
resource "aws_iam_policy" "firehose_s3_policy" {
  name = "${var.kinesis_firehose_iam_role_name}-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucketMultipartUploads",
          "s3:AbortMultipartUpload",
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ],
        "Resource" : ["${var.sec_hub_findings_bucket_arn}", "${var.sec_hub_findings_bucket_arn}/*"]
      },
      {
        "Action": [
          "kms:Decrypt",
          "kms:GenerateDataKey",
          "logs:PutLogEvents"
        ],
        "Resource": ["${var.s3_bucket_kms_key_arn}"],
        "Effect": "Allow"
        }   
    ]
  })
}
resource "aws_iam_role" "iam_for_kinesis_firehose" {
  name                = var.kinesis_firehose_iam_role_name
  assume_role_policy  = data.aws_iam_policy_document.assume_role_firehose.json
  managed_policy_arns = [aws_iam_policy.firehose_s3_policy.arn]
}
########################## Kinesis Firehose #############################
resource "aws_kinesis_firehose_delivery_stream" "kinesis_delivery_stream" {
  name        = var.kinesis_delivery_stream_name
  destination = "extended_s3"
  extended_s3_configuration {
    role_arn           = aws_iam_role.iam_for_kinesis_firehose.arn
    bucket_arn         = var.sec_hub_findings_bucket_arn
    buffering_size     = 128
    buffering_interval = 900
    compression_format = "UNCOMPRESSED"
    prefix             = "raw/firehose/"
  }
}
########################## Cloudwatch Event Rule #############################
resource "aws_cloudwatch_event_rule" "firehose_event_rule" {
  name        = var.firehose_event_rule_name
  description = "Security Hub Event Rule"
  event_pattern = jsonencode({
    "source" : [
      "aws.securityhub"
    ],
    "detail-type" : [
      "Security Hub Findings - Imported"
    ],
  })
}
resource "aws_cloudwatch_event_target" "kinesis_firehose" {
  target_id = "FirehoseStream"
  arn       = aws_kinesis_firehose_delivery_stream.kinesis_delivery_stream.arn
  rule      = aws_cloudwatch_event_rule.firehose_event_rule.name
  role_arn  = aws_iam_role.security_hub_log_delivery_role.arn
}