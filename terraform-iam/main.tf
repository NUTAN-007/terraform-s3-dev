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

resource "aws_iam_policy" "my_policy" {
  name        = "MyCustomPolicy"
  description = "Custom S3 ReadOnly Policy"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:GetObject", "s3:ListBucket"]
        Effect   = "Allow"
        Resource = ["arn:aws:s3:::my-bucket", "arn:aws:s3:::my-bucket/*"]
      }
    ]
  })
  tags = {
    Environment = "Dev"
    Owner       = "Nutan"
  }
}

resource "aws_iam_user" "my_user" {
  name = "NutanUser"
}

resource "aws_iam_user_policy_attachment" "attach_custom_policy" {
  user       = aws_iam_user.my_user.name
  policy_arn = aws_iam_policy.my_policy.arn
}

