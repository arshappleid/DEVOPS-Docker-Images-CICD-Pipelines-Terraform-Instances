# Provider configuration
provider "aws" {
  region = "us-east-1" # Change to your desired region
}

# EC2 Instance resource
resource "aws_instance" "server_1" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 18.04 LTS
  instance_type = "t2.micro"


  # Networking configuration
  vpc_security_group_ids = [aws_security_group.server_1_sg.id]
  subnet_id              = aws_subnet.server_1_subnet.id

  # User data script to install Docker on the instance
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
              sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              sudo apt-get update -y
              sudo apt-get install -y docker-ce docker-ce-cli containerd.io
              EOF
}

# Security Group resource to allow SSH and HTTP/HTTPS traffic
resource "aws_security_group" "server_1_sg" {
  name_prefix = "server_1_sg"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH traffic from any IP address
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP traffic from any IP address
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTPS traffic from any IP address
  }
}

# Subnet resource to launch the EC2 instance in
resource "aws_subnet" "server_1_subnet" {
# make sure this information , matches with the subnet you are trying to launch the ec2 instance in.
  cidr_block = "10.0.0.0/16" # Change to your desired subnet CIDR block
  vpc_id = "vpc-0f81cfaf22b803b53"
}

# Output the public IP address of the instance
output "public_ip" {
  value = aws_instance.server_1.public_ip
}
