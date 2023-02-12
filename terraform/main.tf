provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-0d1ddd83282187d18"
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins Server"
  }

  vpc_security_group_ids = [aws_security_group.sg.id]

  key_name = "deployer-key"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "sg" {
  name = "security-group"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
