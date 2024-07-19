output "s3_bucket_arn" {
  value       = aws_s3_bucket.ssh_keys_backup.arn
  description = "The ARN of the S3 bucket"
}
