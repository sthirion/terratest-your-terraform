# Output variable definitions

# output "arn" {
#   description = "ARN of the bucket"
#   value       = aws_s3_bucket.s3_bucket.arn
# }

# output "name" {
#   description = "Name (id) of the bucket"
#   value       = aws_s3_bucket.s3_bucket.id
# }

output "bucket_id" {
  description = "ID of the bucket"
  value       = aws_s3_bucket.test_bucket.id
}

output "bucket_arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.test_bucket.arn
}