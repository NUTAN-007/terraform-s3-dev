import {
      for_each = var.enable_import ? {import_s3_bucket = var.bucket_name} : {}
      to       = aws_s3_bucket.create_bucket
      id       = var.bucket_name
    }
