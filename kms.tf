provider "aws" {
  region = "us-east-1"
}

resource "aws_kms_key" "simple_key" {
  description             = "My simple KMS key"
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "simple_alias" {
  name          = "alias/my-key-alias"  # Alias name (must start with 'alias/')
  target_key_id = aws_kms_key.simple_key.key_id  # Reference to the KMS key
}                                                                                 
