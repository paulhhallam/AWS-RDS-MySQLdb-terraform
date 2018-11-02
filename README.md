# AWS-RDS-MySQLdb-terraform
A simple terraform script to create an AWS RDS MySQL DB on a new VPC specifically created for the database and NOT the default VPC created for the region.

This simple setup just creates an RDS MySql database and an EC2 instance.

I'd suggest downloading MySQL Workbench onto your PC and attempting to connect to the database using:

	endpoint as shown on the RDS instance page, e.g. moluccan2.cffnmgekx1nd.us-east-2.rds.amazonaws.com
	port 36
	username meme 
	password Password


My biggest hassle in the old days was creating an RDS database NOT on the default VPC.
It took me some time to work out the intricacies of this and I'm only sorry it's taken me so long to record it.

For simplicity I have hardcoded certain values but these can obviously be changed to secrets, 
environment variables or entered on the terraform command lines.

	The MySQL db user is hardcoded in rds.tf
	The MySQL db user password is hardcoded in vars.tf 

If you use these scripts please remember to change these values.

The terraform commands to run the scripts are:

	terraform init -var-file="<location and name of your secrets file>.auto.tfvars"
	terraform apply -var-file="<location and name of your secrets file>.auto.tfvars"
	terraform delete -var-file="<location and name of your secrets file>.auto.tfvars"

where <location and name of your secrets file>.auto.tfvars contents are similar to the following:
  
	MySecretKeys.auto.tfvars
  	access_key = "<your AWS access key"
  	secret_key = "<your AWS secret key>"

FILES:

 	provider.tf   Defines the provider (AWS) and creates an EC2 instance
	rds.tf        Creates the RDS MySQL database
	secret.tf     Defines the variables for the access and sceret keys.
	sg.tf         Creates the security group allowing ALL access on all ports (dangerous).
	vars.tf       Defines the AMI's (Amazon Machine Image) and instance type to use as well as the RDS db password.
	vpc.tf        Creates the VPC, subnets, subnet group, route table and its associations and a network access control
	
