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

resource "aws_db_instance" "mydb" {
identifier              = "database-1"
  instance_class          = "db.t4g.small"       # matches actual RDS instance
  engine                  = "postgres"
  engine_version          = "15.12"
  username                = "postgres"
  allocated_storage       = 20
  max_allocated_storage   = 1000
  storage_encrypted       = true
  kms_key_id              = "arn:aws:kms:us-east-1:588436839216:key/950b0efd-e9af-4d3f-aa11-cf3ed8e8d330"
  db_subnet_group_name    = "default-vpc-0925fff2205ddbfe4"
  vpc_security_group_ids  = ["sg-0b89cc35134db7c47"]
  publicly_accessible     = false
  backup_retention_period = 1
  skip_final_snapshot     = true
  deletion_protection     = false
  copy_tags_to_snapshot   = true
  storage_type            = "gp2"
  #apply_immediately       = true
  port                    = 5432
  performance_insights_enabled = true
  tags = {}
}
