resource "aws_sns_topic" "kms_notification_snstopic" {
  name = var.sns_topic_name
  kms_master_key_id = var.kms_key_alias
}

resource "aws_sns_topic_policy" "sns_topic_policy" {
  arn    = aws_sns_topic.kms_notification_snstopic.arn
  policy = data.aws_iam_policy_document.sns_policy.json
}

resource "aws_sns_topic_subscription" "kms_email_notification" {
  topic_arn = aws_sns_topic.kms_notification_snstopic.arn
  protocol  = "email"
  endpoint  = var.kms_notification_email_id
}
########################## Delete KMS Key Notification #############################
resource "aws_cloudwatch_event_rule" "kms_deletion_rule" {
  name        = var.kms_deletion_rule_name
  description = "Capture delete KMS key events"

  event_pattern = jsonencode({
    "source" : [
      "aws.kms"
    ],
    "detail-type" : [
      "AWS API Call via CloudTrail"
    ],
    "detail" : {
      "eventSource" : [
        "kms.amazonaws.com"
      ],
      "eventName" : [
        "ScheduleKeyDeletion"
      ]
    }
  })
}

resource "aws_cloudwatch_event_target" "kms_deletion_notification" {
  arn       = aws_sns_topic.kms_notification_snstopic.arn
  target_id = "SendToSNS"
  rule      = aws_cloudwatch_event_rule.kms_deletion_rule.id
  input_transformer {
    input_paths = {
      days : "$.detail.responseElements.pendingWindowInDays",
      deletedate : "$.detail.responseElements.deletionDate",
      key : "$.detail.responseElements.keyId",
      awsaccid : "$.detail.userIdentity.accountId",
      user : "$.detail.userIdentity.userName",
      eventdate : "$.detail.eventTime"
    }
    input_template = "\"There is a KMS key scheduled for deletion.Please find the details below.\"\n\"Account ID: <awsaccid>\"\n\"Deletion Scheduled by: <user>\"\n\"KMS Key ID: <key>\"\n\"Scheduled deletion date: <deletedate>\"\n\"No of days to deletion: <days> days\"\n\"Deletion action trigger at: <eventdate>\"\n"
  }
}
########################## Disable KMS Key Notification #############################
resource "aws_cloudwatch_event_rule" "kms_disable_rule" {
  name        = var.kms_disable_rule_name
  description = "Capture disable KMS key events"

  event_pattern = jsonencode({
    "source" : [
      "aws.kms"
    ],
    "detail-type" : [
      "AWS API Call via CloudTrail"
    ],
    "detail" : {
      "eventSource" : [
        "kms.amazonaws.com"
      ],
      "eventName" : [
        "DisableKey"
      ]
    }
  })
}

resource "aws_cloudwatch_event_target" "kms_disable_notification" {
  arn       = aws_sns_topic.kms_notification_snstopic.arn
  target_id = "SendToSNS"
  rule      = aws_cloudwatch_event_rule.kms_disable_rule.id
  input_transformer {
    input_paths = {
      days : "$.detail.responseElements.pendingWindowInDays",
      deletedate : "$.detail.responseElements.deletionDate",
      key : "$.detail.responseElements.keyId",
      awsaccid : "$.detail.userIdentity.accountId",
      user : "$.detail.userIdentity.userName",
      eventdate : "$.detail.eventTime"
    }
    input_template = "\"There is a KMS key disabled.Please find the details below.\"\n\"Account ID: <awsaccid>\"\n\"Disabled by: <user>\"\n\"KMS Key ID: <key>\"\n\"Disable action trigger at: <eventdate>\"\n"
  }
}
