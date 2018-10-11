### terraform apply \
### terraform apply  ## automatically finds terraform.tfvars AND *.auto.tfvars
### terraform apply -var-file=variables.tfvars
### Terraform will read environment variables in the form of TF_VAR_name

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  version    = "~> 1.30"
  }

