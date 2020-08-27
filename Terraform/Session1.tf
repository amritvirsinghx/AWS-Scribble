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
