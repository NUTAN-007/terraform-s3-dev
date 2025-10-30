output "bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.create_bucket.bucket
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = aws_s3_bucket.create_bucket.arn
}

output "bucket_region" {
  description = "The region where the bucket is created"
  value       = var.aws_region
}
