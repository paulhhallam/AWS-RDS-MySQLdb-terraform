provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
  version    = "~> 1.30"
}

resource "aws_instance" "moluccan2" {
  ami = "${var.amis[var.region]}"
  instance_type = "${var.aws_instance_type}"
  subnet_id = "${aws_subnet.moluccan2-Pub1.id}"
  vpc_security_group_ids = ["${aws_security_group.moluccan2.id}"]
}
