        terraform {
        required_providers {
            aws = {
            source  = "hashicorp/aws"
            version = "~> 6.0"
            }
        }
        }

        provider "aws" {
        region = "us-east-1"
        }

        resource "aws_s3_bucket" "my_bucket" {
        bucket = "my-unique-bucket-name-np2710"
        #acl    = "private"
        tags = {
            Name        = "MyBucket"
            Environment = "Dev"
            Owner       = "Nutan"
        }
        }

        resource "aws_s3_object" "my_folder" {
        bucket = aws_s3_bucket.my_bucket.id
        key    = "my-first-folder/"
        }

        resource "aws_s3_bucket_lifecycle_configuration" "bucket_config" {
        bucket = aws_s3_bucket.my_bucket.id

        rule {
            id     = "log"
            status = "Enabled"

            filter {
            and {
                prefix = "log/"
            }
            }

            transition {
            days          = 30
            storage_class = "STANDARD_IA"
            }

            transition {
            days          = 60
            storage_class = "GLACIER"
            }

            expiration {
            days = 90
            }
        }
        }

        resource "aws_s3_bucket_policy" "bucket_policy" {
        bucket = aws_s3_bucket.my_bucket.id
        policy = file("${path.module}/bucket-policy.json")
        }

        resource "aws_s3_bucket_logging" "enable_logging" {
        bucket        = aws_s3_bucket.my_bucket.id
        target_bucket = "boto3-test-bucket-007"
        target_prefix = "server-access-logs/"
        }

        

        