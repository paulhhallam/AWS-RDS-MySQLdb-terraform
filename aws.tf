variable "region"            {default = "us-east-2"}
variable "MyRDSNetn"         {default = "NET-USE1"}
variable "aws_instance_type" {default = "t2.micro"}

variable "MyRDSNet" {
  type = "map"
    default = {
      "us-east-1" = "NET-USE1"
  	  "us-east-2" = "NET-USE2"
      "us-west-2" = "NET-USW2"
  } 
}
      
variable "amis" {
  type = "map"
   default = {
    "us-east-1" = "ami-b374d5a5"
	"us-east-2" = "ami-5e8bb23b"
    "us-west-2" = "ami-4b32be2b"
  } 
}

#variable "NET.sec_group_ids" {
#  type = "list"
#  }

#variable "vps_security_group_ids" { type = "list" }
