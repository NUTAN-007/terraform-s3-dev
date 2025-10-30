variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "bucket_tag_name" {
  description = "Tag name for the S3 bucket"
  type        = string
  default     = "MyBucket"
}

variable "bucket_environment" {
  description = "Environment tag (e.g., Dev, Prod)"
  type        = string
  default     = "Dev"
}

variable "bucket_owner" {
  description = "Owner of the S3 bucket"
  type        = string
}

variable "folder_name" {
  description = "Folder name to be created inside the bucket"
  type        = string
  default     = "my-first-folder/"
}

variable "lifecycle_rule_id" {
  description = "Lifecycle rule ID"
  type        = string
  default     = "log"
}

variable "lifecycle_status" {
  description = "Enable/Disable lifecycle rule"
  type        = string
  default     = "Enabled"
}

variable "lifecycle_prefix" {
  description = "Prefix for lifecycle rule"
  type        = string
  default     = "log/"
}

variable "transition_days_1" {
  description = "Days before moving to STANDARD_IA"
  type        = number
  default     = 30
}

variable "transition_storage_class_1" {
  description = "Storage class for first transition"
  type        = string
  default     = "STANDARD_IA"
}

variable "transition_days_2" {
  description = "Days before moving to GLACIER"
  type        = number
  default     = 60
}

variable "transition_storage_class_2" {
  description = "Storage class for second transition"
  type        = string
  default     = "GLACIER"
}

variable "expiration_days" {
  description = "Days after which objects expire"
  type        = number
  default     = 90
}

variable "aws_account_id" {
  description = "AWS Account ID for IAM user policy"
  type        = string
}

variable "iam_user" {
  description = "IAM username to allow access to bucket"
  type        = string
}

variable "logging_target_bucket" {
  description = "Target bucket for server access logs"
  type        = string
}

variable "logging_target_prefix" {
  description = "Prefix for storing server access logs"
  type        = string
  default     = "server-access-logs/"
}


variable "enable_import" {
  type = bool
  default = false
}