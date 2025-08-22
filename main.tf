provider "aws" {
  region = "ap-southeast-3"
}

resource "aws_instance" "ram" {
  ami                    = "ami-0c82cd70874a842cf"
  instance_type          = "t3.micro"
  key_name               = "webserver-apache-key"
  subnet_id              = "subnet-049f77a69bee62037"
  vpc_security_group_ids = ["sg-04049b72b0df7ca4d"]

  tags = {
    Name = "Development Server"
  }
}

output "public_ip" {
  value = aws_instance.ram.public_ip
}
