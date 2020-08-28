# AWS-Scribble
This for AWS technology practice

Reference:
https://www.terraform.io/docs/providers/aws/index.html

## What is Terraform? 

Terraform is a tool made by Hashicorp for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers ( aws, azure, Google cloud) as well as custom in-house solutions.

You can compare **Terraform** to **Cloudformation**
. They are simililar but at the same time have differences.

### Steps to provision

1) Download the terraform binary file 
https://www.terraform.io/downloads.html

2) Write code to .tf file
3) Initialize by using terraform init
4) Apply with terrafrom apply
5) detroy with terraform apply


### Basic Code
~~~
##################################################################################
# RESOURCES
##################################################################################

resource "aws_instance" "sess1" {
  ami           = "ami-c58c1dd3"
  instance_type = "t2.micro"
  key_name="logon2"

  connection {
    host= self.public_ip
    user        = "ec2-user"
    private_key = file("/logon2.pem")
 }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start"
    ]
  }
}

##################################################################################
# OUTPUT
##################################################################################

output "aws_instance_public_dns" {
    value = aws_instance.sess1.public_dns
}
~~~
