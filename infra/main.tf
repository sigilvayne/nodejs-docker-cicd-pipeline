provider "aws" {
  region = var.region
}

resource "aws_security_group" "web_sg" {
  name        = "nodejs-web-sg"
  description = "Allow SSH, HTTP, and app port"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "node_app" {
  ami           = "ami-05fcfb9614772f051"
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.web_sg.name]
  associate_public_ip_address = false 

  tags = {
    Name = "nodejs-cicd"
  }
}

resource "aws_eip" "node_app_eip" {
  domain = "vpc"
}

resource "aws_eip_association" "node_app_eip_assoc" {
  instance_id   = aws_instance.node_app.id
  allocation_id = aws_eip.node_app_eip.id
}