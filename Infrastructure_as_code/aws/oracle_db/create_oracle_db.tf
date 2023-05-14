provider "aws" {
  region = "us-east-1"
}

resource "aws_secretsmanager_secret" "rds_secret" {
  name        = "your_secret_name"
  description = "RDS DB credentials"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = <<EOF
{
  "username": "master"
}
EOF
}

## Best way to understand these parameteres is to go to the create Database page
resource "aws_db_instance" "default" {
  allocated_storage    = 20      ## How many GBs of storage
  storage_type         = "gp2"  
  engine               = "oracle-se2"
  engine_version       = "19.0.0.0.ru-2020-07.rur-2020-07.r1"
  instance_class       = "db.m5.large"
  name                 = "rd_db_1"
  username             = "master"
  password             = aws_secretsmanager_secret_version.rds_secret_version.secret_string
  parameter_group_name = "default.oracle-se2-19"
  skip_final_snapshot  = true
  license_model        = "license-included" # Please review and set appropriate licensing model
  db_subnet_group_name = "your_db_subnet_group_name" # Please replace with your DB subnet group
  backup_retention_period = 7
}

output "RDS_Secret_ARN" {
  description = "The ARN of the Secrets Manager secret"
  value       = aws_secretsmanager_secret.rds_secret.arn
}


