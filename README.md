# AWS-RDS-MySQLdb-terraform
AWS simple RDS MySQL DB using terraform

These scripts will create a MySQL RDS database on a new VPC using terraform.

My biggest hassle in the old days was creting an RDS database NOT on the default VPC.
It took me some time to work out the intricacies of this and I'm only sorry it's taken me so long to record it.

For simplicity I have hardcoded certain values but these can obviously be changed to secrets, 
environment variables or enetered on the terraform command lines.

The MySQL db user is hardcoded in rds.tf
The MySQL db user password is hardcoded in vars.tf 

If you use these scripts please remember to change these values.

The terraform commands to run the scripts are:

terraform init -var-file="<location and name of your secrets file>.auto.tfvars"
terraform apply -var-file="<location and name of your secrets file>.auto.tfvars"
terraform delete -var-file="<location and name of your secrets file>.auto.tfvars"

where <location and name of your secrets file>.auto.tfvars is similar to the following:
#MySecretKeys.auto.tfvars
access_key = "<your AWS access key"
secret_key = "<your AWS secret key>"