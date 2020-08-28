## KEY NOTE
This document is the basic overview of the steps I perfromed to launch my first Terraform infrastructure. Follow the setps along

### 1) Installing Chocolaty and Terraform 
I chose chocolatey to install terraform you can use download installer from official site or use other package manager as per your needs.

After installing terraform using chocolatey, if you run the following command to check you will get the output something like this
~~~
Terraform
~~~

### 2) Initializing Terraform
Write a basic "tf" document (in our case _Basic_deployment.tf_ to launch infrastucture via terraform and then intialize terraform using following command in same location as of your .tf file
~~~
Terraform init
~~~

You will get the following output on successful initialization

### 3) Installing Pre-requisites and Error Debugging

- Make sure AWS CLI is installed and configured

  You can install it using chocolatey in admin powershell
~~~
choco install awscli
~~~

  on successful install you can check it as follows:
  
  Finally configure it with your IAM using:
  
  ~~~
  aws configure
  ~~~
  
- Make your your IAM has full EC2 access:


### 4) Deploying Terraform
  Then use the following command to apply and launch the infrastucture via terraform
~~~
Terrafrom apply
~~~

  Deployed instance can be viewed in console:



