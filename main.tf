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

  provisioner "local-exec" {
    command = <<EOT
      echo "[webserver]">$WORKSPACE/inventory.ini
      echo "${self.public_ip} ansible_user=ubuntu" >> $WORKSPACE/inventory.ini
      sleep 60
      echo "Terraform successfully run and Inventory created"
    EOT
  }
}

