provider "aws" {
  region = "ap-south-1" # Mumbai region
}

resource "aws_instance" "demo_ec2" {
  ami           = "ami-0af9569868786b23a" # Ubuntu 22.04 LTS (Mumbai - May 2024)
  instance_type = "t2.micro"

  key_name = "mumbai.key"  # Replace with your EC2 key pair name

  tags = {
    Name = "Demo-EC2"
  }

  # Optional: Security group to allow SSH
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Be careful with open access!
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_vpc" "default" {
  default = true
}
