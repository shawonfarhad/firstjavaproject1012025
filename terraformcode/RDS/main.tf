terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"  # Replace with your AWS CLI profile name
  region  = "us-east-2"
}

resource "aws_db_instance" "example" {
  allocated_storage    = 20
  engine               = "mysql"         # Change to "postgres", "oracle", etc., if needed
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"   # Choose an appropriate DB instance type
  name                 = "exampledb"     # Name of the database
  username             = "admin"         # Master username
  password             = "examplepass123" # Master password
  parameter_group_name = "default.mysql8.0" # Parameter group for MySQL 8.0
  skip_final_snapshot  = true            # Optional: Avoid final snapshot upon deletion
  publicly_accessible  = true            # Allows access from the publi8c internet (optional)

  tags = {
    Name = "ExampleRDSInstance"
  }
}