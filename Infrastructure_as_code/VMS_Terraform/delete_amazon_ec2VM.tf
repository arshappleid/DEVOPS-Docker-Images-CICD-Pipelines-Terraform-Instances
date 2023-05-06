# Define AWS provider
provider "aws" {
  region = "us-east-1"
}

# Delete the EC2 instance
resource "aws_instance" "server_1" {
    # instance id , can be taken by running ``` terraform show ```
  instance_id = "your_instance_id"

  # Use the "delete" action to terminate the instance
  lifecycle {
    ignore_changes = [tags] # Ignore changes to the instance tags
    prevent_destroy = false
    create_before_destroy = true
  }
}
