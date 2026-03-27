resource "aws_instance" "bastion_host" {
  ami           = "ami-0ec10929233384c7f"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "bastion_host"
  }
}

resource "aws_instance" "Jenkins_server" {
  ami           = "ami-0ec10929233384c7f"
  instance_type = "t3.small"
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "Jenkins_server"
  }
}

resource "aws_instance" "Sonarqube_server" {
  ami           = "ami-0ec10929233384c7f"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "Sonarqube_server"
  }
}


