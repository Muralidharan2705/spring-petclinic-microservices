provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "dev_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.dev_sg.id]

  user_data = file("user_data.sh")

  tags = {
    Name = "Dev-Server"
  }
}

resource "aws_security_group" "dev_sg" {
  name_prefix = "dev-server-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change for better security
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2375
    to_port     = 2376
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Docker remote API (optional)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "dev_eip" {
  domain   = "vpc"
}

resource "aws_eip_association" "dev_eip_assoc" {
  instance_id   = aws_instance.dev_server.id
  allocation_id = aws_eip.dev_eip.id
}
