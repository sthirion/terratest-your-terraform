# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A S3 BUCKET WITH VERSIONING ENABLED INCLUDING TAGS
# See terratest/s3_test.go for how to write automated tests for this code.
# ---------------------------------------------------------------------------------------------------------------------

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    effect = "Allow"
    principals {
      identifiers = [00000000]
      type        = "AWS"
    }
    actions   = ["*"]
    resources = ["${aws_s3_bucket.test_bucket.arn}/*"]
  }

  statement {
    effect = "Deny"
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    actions   = ["*"]
    resources = ["${aws_s3_bucket.test_bucket.arn}/*"]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values = [
        "false",
      ]
    }
  }
}

resource "aws_s3_bucket" "test_bucket_logs" {
  bucket = "${var.tag_bucket_name}-log-bucket"
  acl    = "log-delivery-write"

  tags = {
    Name        = "${var.tag_bucket_name}-logs"
    Environment = var.tag_bucket_environment
  }

  force_destroy = true
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = var.tag_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  logging {
    target_bucket = aws_s3_bucket.test_bucket_logs.id
    target_prefix = "TFStateLogs/"
  }

  tags = {
    Name        = var.tag_bucket_name
    Environment = var.tag_bucket_environment
  }
}

resource "aws_s3_bucket_policy" "bucket_access_policy" {
  count  = var.with_policy ? 1 : 0
  bucket = aws_s3_bucket.test_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}
