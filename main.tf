## Defination of Cloud provider ##
provider "aws" {
  

region = "ap-southeast-3"
}

## Provision of EC2 server##
resource "aws_instance" "ram" {

    instance_type = "t3.micro"
    ami = "ami-0c82cd70874a842cf"
    key_name = "devops1"
    vpc_security_group_ids = ["sg-04049b72b0df7ca4d"]
    tags = {
        Name= "Developement Server"  
    }
#### After provision now will create inventory.ini ###
     provisioner "local-exec" {
        command = <<EOT
       
       echo "[webserver]">$WORKSPACE/inventory.ini
       echo "${self.public_ip} ansible_user=ubuntu" >>$WORKSPACE/inventory.ini
       sleep 60
       echo "Terraform successfully run and Inventory created"        
       EOT 
     }

}
