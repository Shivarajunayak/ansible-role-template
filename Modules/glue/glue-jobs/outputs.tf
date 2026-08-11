output "glue_job_name" {
  description = "The name of the AWS Glue job"
  value       = aws_glue_job.glue_job.name
}
output "glue_job_arn" {
  description = "The ARN of the AWS Glue job"
  value       = aws_glue_job.glue_job.arn
}
