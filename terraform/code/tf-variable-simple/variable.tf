variable "region" {
  description = "AWS region to deploy"
  default     = "ap-south-1"
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0e1d30f2c40c4c701" # Example for ap-south-1
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the existing AWS key pair"
  default     = "my-keypair"
}
