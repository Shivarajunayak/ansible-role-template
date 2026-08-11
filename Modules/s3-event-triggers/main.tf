module "s3_bucket_event_notifications" {

  source = "./modules/notification"

  bucket = var.bucket_name

  eventbridge = try(var.eventbridge, false)

  lambda_notifications = try(var.lambda_notifications, {})
  sns_notifications    = try(var.sns_notifications, {})
  sqs_notifications    = try(var.sqs_notifications, {})

}
