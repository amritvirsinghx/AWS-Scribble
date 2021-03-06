## Objective
In this code we used terraform to instantiate a Redhat EC2 instance on AWS and deployed a sample website on top of it 

## Pre-Requisites 
Min requirements:
- AWS Account and CLI installed
- Terraform installed (if you need to installed it kindly refer 01_Basics)
- Some Knowlegde of AWS security groups, VPC and subnets 

## Steps to Replicate
1) Clone the repo in your local machine
2) Open folder _2_Creating_webserver_. this will be your working directory
3) Configure your AWS account to your IAM user (with EC2 and S3 Full Access) using following command:
~~~
aws configure
~~~
![](.images/awsconfigure.JPG)

4) Download a key pair for your EC2 instance and place it in the same location

![](.images/keypair.JPG)

5) Set your _ami, instance_type_ and _key_name_ variables

![](.images/resources.JPG)

6) Change your HTML code for index page or you can even attach a custom HTML file
7) To Deploy type the following commands in your terminal in same location (type "yes" when prompted)
~~~
terraform init
terraform apply
~~~
8) Access your website your using _IPv4 Public IP_ from the console, You can even SSH on your EC2 instance if you wish.

![](.images/publicip.JPG)

Deployed:

![](.images/Deployement.JPG)

9) To Destroy your intance type:
~~~
terraform destroy
~~~

Incase you want to define and attach your own security group, feel free to do so.
