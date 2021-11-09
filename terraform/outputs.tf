# Output variable definitions

output "bucket_id" {
  description = "ID of the bucket"
  value       = aws_s3_bucket.test_bucket.id
}
