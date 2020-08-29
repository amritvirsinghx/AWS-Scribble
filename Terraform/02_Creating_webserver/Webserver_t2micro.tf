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
type :Redhat
arch: t2.micro
*/

resource "aws_instance" "Redhat"{
    ami = "ami-098f16afa9edf40be"
    instance_type="t2.micro"
    security_groups=["${aws_security_group.ssh_http.name}"]
    key_name = "EC2_key" #specify your key here
    user_data = <<-EOF
		#! /bin/bash
        sudo yum install httpd -y
        sudo systemctl start httpd
        sudo systemctl enable httpd
        echo "<h1> Deployed via Terraform<br>This is my first live infrastructure deployment<br></h1><h2>Resources:<br>
        OS:Redhat<br>Compute power: T2.Micro <br> Security groups configured<br>SSH Port: 22 <br> HTTP Port:80
        </h2>">> /var/www/html/index.html
    EOF
    tags ={
        Name = "WebServer"
    }
}