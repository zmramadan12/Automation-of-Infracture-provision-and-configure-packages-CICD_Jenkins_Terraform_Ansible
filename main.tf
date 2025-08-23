provider "aws" {
  region = "ap-southeast-3"
}

resource "aws_instance" "ram" {
  ami                    = "ami-003a6aabfe9d0683e"
  instance_type          = "t3.micro"
  key_name               = "webserver-apache-key"
  subnet_id              = "subnet-049f77a69bee62037"
  vpc_security_group_ids = ["sg-03178d4210f26d464"]

  tags = {
    Name = "Development Server"
  }
}

output "public_ip" {
  value = aws_instance.ram.public_ip
}


