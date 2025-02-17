variable "aws_region" {
  description = "AWS Region"
  default     = "ap-southeast-2"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID"
  default     = "ami-08a84371426a8acd1" # Update with the latest AMI ID
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Pair Name"
  default     = "Mur-Key" # Replace with your key pair name
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be deployed"
  default     = "subnet-068d9cbeb6d1bb287"  # Replace with your actual Subnet ID
}
