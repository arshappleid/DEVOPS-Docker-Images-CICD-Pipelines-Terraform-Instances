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

## Provider Config

provider "aws" {
  region = "us-east-1"
  alias = "aws-east-1"
}
## define the bucket name as a variable


resource "aws_s3_bucket" "bucket_1"{
	bucket = "bucket_name_1" ## Other resources can refer to this resource using this name
	provider = aws.aws-east-1 ## will import region info

	tags = {
		Name = "bucket_id_1" ## AWS resource name
		Environement = "Dev"
	}
}

output "resource_info" {
	description  = "Bucket created (name): "
	value = aws_s3_bucket.bucket_1.id
}