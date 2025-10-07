
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"  # Provider source
      version = ">= 5.0.0"         # Version constraint
    }
  }
}


# Specify the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create an EC2 instance
resource "aws_instance" "my_server" {
  ami           = "ami-0c94855ba95c71c99"  # Example Ubuntu AMI
  instance_type = "t3.micro"

  tags = {
    Name = "MyServer"
  }
}
