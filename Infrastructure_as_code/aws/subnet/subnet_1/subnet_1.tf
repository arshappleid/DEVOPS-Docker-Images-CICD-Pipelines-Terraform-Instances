## Version Config
terraform {
  required_version = "~> 1.4.6" ## use this exact version
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0" ## use this exact verion
    }
  }
}

## Subnet Config

provider "aws"{
	region = "us-west-1"
	alias = "aws-east-1"		## 
}

resource "aws_subnet" "vpc-aws-east-1"{
	cidr_block = "10.1.0.0/4"  ## subnet with 4 end points
	provider = "aws-east-1"		## which provider , specific to region to use.
	tags =  {"Name" ="vpc-aws-east-1"}
}