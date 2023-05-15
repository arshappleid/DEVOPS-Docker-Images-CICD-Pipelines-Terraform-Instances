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
## Configure in which region do we deploy this vpc in.
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "v_net1" {
  cidr_block = "10.0.0.0/16" ## Allow 15 devices to be connected to this vpc
  alias = "aws-east-1"       ## to refer this subnet in other instances.
  tags  = {
    Name = "test_vpc"
  }
}



