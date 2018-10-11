
resource "aws_db_instance" "moluccan2" {
  skip_final_snapshot    = true
  engine               = "mysql"
  engine_version       = "5.7.19"
  identifier           = "moluccan2"
  instance_class       = "db.t2.small"
  multi_az             = false
  name                 = "moluccan2"
  publicly_accessible  = true
  allocated_storage    = 5
  name                 = "moluccan2"
  username             = "phh"
  password             = "${var.RDSPWD}"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "${aws_db_subnet_group.moluccan2.name}"
  vpc_security_group_ids   = ["${aws_security_group.moluccan2.id}"]
  depends_on = ["aws_internet_gateway.moluccan2"]
  tags { 
    Name = "moluccan2"
  }
}

