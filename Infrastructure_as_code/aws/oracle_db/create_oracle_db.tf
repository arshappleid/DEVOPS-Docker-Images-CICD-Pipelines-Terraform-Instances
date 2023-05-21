provider "aws" {
  region = "us-east-1"
}

resource "aws_secretsmanager_secret" "rds_secret" {
  name        = "admin"
  description = "RDS DB credentials"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id = aws_secretsmanager_secret.rds_secret.id
  ## secret is stored in rds secret manager, under the username master
  secret_string = <<EOF
{
  "username": "master"
}
EOF
}
resource "aws_ec" "name" {
  
}
## Best way to understand these parameteres is to go to the create Database page
resource "aws_db_instance" "default" {
  allocated_storage            = 20  ## 20GB is the mininum
  max_allocated_storage        = 100 ## Database will autoscale at extra charges, when autoscaling
  storage_type                 = "gp2"
  engine                       = "oracle-se2"
  engine_version = 
  instance_class               = "db.m5.large"
  username                     = "master"
  password                     = aws_secretsmanager_secret_version.rds_secret_version.secret_string
  parameter_group_name         = "default.oracle-se2-19"
  skip_final_snapshot          = true
  performance_insights_enabled = false      ## since turning this on costs extra money.
  db_subnet_group_name         = "test_vpc" # Please replace with your DB subnet group
  backup_retention_period      = 3          ## save backups for n days
}

output "RDS_Secret_ARN" {
  description = "The ARN of the Secrets Manager secret"
  value       = aws_secretsmanager_secret.rds_secret.arn
}


