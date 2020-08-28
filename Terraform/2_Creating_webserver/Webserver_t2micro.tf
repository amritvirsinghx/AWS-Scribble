#configure AWS provider

provider "aws"{
    region = "us-east-1"
}

#creating a security group to allow ssh and http

resource "aws_security_group" "ssh_http"{
    name ="terra_ssh_http"
    description="allowing ssh and http"

    ingress{
        from_port=22
        to_port =22
        protocol ="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }

    ingress{
        from_port =80
        to_port=80
        protocol="tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }

    egress{
        from_port =0
        to_port=0
        protocol="-1"
        cidr_blocks= ["0.0.0.0/0"]
    }
     
}

/*
creating instance
type :ubuntu
arch: t2.micro
*/

resource "aws_instance" "ubuntu"{
    ami = "ami-0bcc094591f354be2"
    instance_type="t2.micro"
    security_groups=[${aws_security_group.ssh_http.name}]
    key_name = "logon" #specify your key here
    user_data = <<-EOF
        #! /bin/bash
        sudo yum install httpd -y
        sudo systemctl start httd
        sudo systemctl enable httpd
        echo "<h1> Sample Website created via terrafrom </h1>" >> /var/www/html/index.html
    EOF
    tags ={
        Name = "WebServer"
}