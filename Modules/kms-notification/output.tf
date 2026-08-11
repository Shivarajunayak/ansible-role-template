output "sns_topic_arn" {
    description = "SNS Topic ARN for KMS Notification"
    value = aws_sns_topic.kms_notification_snstopic.arn
}