provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "Simple-Terraform-Instance"
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
