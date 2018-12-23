
resource "aws_db_instance" "instance2" {
  skip_final_snapshot    = true
  engine               = "mysql"
  engine_version       = "5.7.19"
  identifier           = "instance2"
  instance_class       = "db.t2.small"
  multi_az             = false
  name                 = "instance2"
  publicly_accessible  = true
  allocated_storage    = 5
  name                 = "instance2"
  username             = "meme"
  password             = "${var.RDSPWD}"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.instance2.name}"
  vpc_security_group_ids   = ["${aws_security_group.instance2.id}"]
  depends_on = ["aws_internet_gateway.instance2"]
  tags { 
    Name = "instance2"
  }
}
output "EndPoint" {
value = "${aws_db_instance.instance2.endpoint}"
}
output "Identifier" {
value = "${aws_db_instance.instance2.identifier}"
}
output "DB_Name" {
value = "${aws_db_instance.instance2.name}"
}
output "Port" {
value = "${aws_db_instance.instance2.port}"
}
output "MasterUsername" {
value = "${aws_db_instance.instance2.username}"
} 
