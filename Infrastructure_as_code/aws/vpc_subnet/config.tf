# Resources BLock
terraform {
  required_version = "~> 1.4.6" ## use this exact version
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0" ## use this exact verion
    }
  }
}
# Resource-1: Treate VPC
resource "aws_vpc" "main_vnet" {
  cidr_block = "10.0.0.0/16"
  region = "us-east-1"
}
# Resource-2: Create Subnets
resource "aws_subnet" "name" {
  region = "us-east-1"
  cidr_block = "10.1.0.0/24" ## 256 end points
}
# Resource-3: Internet Gateway
# Resource-4: Create Route Table
# Resource-5: Create Route in Route Table for Internet Access
# Resource-6: Associate the Route Table with the Subnet
# Resource-7: Create Security Group