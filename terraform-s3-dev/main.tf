resource "aws_s3_bucket" "create_bucket" {
  bucket = var.bucket_name
  tags = {
    Name        = var.bucket_tag_name
    Environment = var.bucket_environment
    Owner       = var.bucket_owner
  }
  force_destroy = true
}

resource "aws_s3_object" "create_folders" {
  bucket = aws_s3_bucket.create_bucket.id
  key    = var.folder_name
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_config" {
  bucket = aws_s3_bucket.create_bucket.id

  rule {
    id     = var.lifecycle_rule_id
    status = var.lifecycle_status

    filter {
      and {
        prefix = var.lifecycle_prefix
      }
    }

    transition {
      days          = var.transition_days_1
      storage_class = var.transition_storage_class_1
    }

    transition {
      days          = var.transition_days_2
      storage_class = var.transition_storage_class_2
    }

    expiration {
      days = var.expiration_days
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.create_bucket.id
  policy = templatefile("${path.module}/bucket-policy.json", {
    aws_account_id = var.aws_account_id
    iam_user       = var.iam_user
    bucket_name    = var.bucket_name
  })
}

resource "aws_s3_bucket_logging" "enable_logging" {
  bucket        = aws_s3_bucket.create_bucket.id
  target_bucket = var.logging_target_bucket
  target_prefix = var.logging_target_prefix
}

resource "null_resource" "delete_folder1" {
provisioner "local-exec" {
command = "aws s3 rm s3://${var.bucket_name}/my-first-folder/ --recursive"
}
}