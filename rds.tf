data "aws_kms_key" "by_id" {
  key_id = "alias/my-key-alias"
}
resource "aws_db_instance" "example" {
  identifier           = "mydbinstance"
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  db_name              = "mydatabase"
  username             = "admin"
  password             = "yourpassword"
  skip_final_snapshot  = true
  publicly_accessible  = false  # Keeping private is more secure

  storage_encrypted    = true
  kms_key_id           = data.aws_kms_key.by_id.arn  # Dynamically fetches ARN

  tags = {
    Name = "MyDBInstance"
  }
}
