
resource "aws_vpc" "moluccan2" {
  cidr_block = "172.30.0.0/16"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
  tags { 
    Name = "moluccan2"
  }
}
  
resource "aws_subnet" "moluccan2-Pub1" {
  vpc_id = "${aws_vpc.moluccan2.id}"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = "true"
  cidr_block = "172.30.0.0/24"
  tags { 
    Name = "moluccan2-Pub1"
  }
}

resource "aws_subnet" "moluccan2-Pub2" {
  vpc_id = "${aws_vpc.moluccan2.id}"
  availability_zone = "us-east-2b"
  cidr_block = "172.30.1.0/24"
  map_public_ip_on_launch = "true"
  tags { 
    Name = "moluccan2-Pub2"
  }
}

resource "aws_subnet" "moluccan2-Pub3" {
  vpc_id = "${aws_vpc.moluccan2.id}"
  availability_zone = "us-east-2c"
  cidr_block = "172.30.2.0/24"
  map_public_ip_on_launch = "true"
  tags { 
    Name = "moluccan2-Pub3"
  }
}

resource "aws_db_subnet_group" "moluccan2" {
  name = "moluccan2-subnet"
  description = "RDS Subnet group"
  subnet_ids = ["${aws_subnet.moluccan2-Pub1.id}","${aws_subnet.moluccan2-Pub2.id}","${aws_subnet.moluccan2-Pub3.id}"]
  tags { 
    Name = "moluccan2"
  }
}

#resource "aws_subnet" "moluccan2-Pub3" {
#  vpc_id = "${aws_vpc.moluccan2.id}"
#  availability_zone = "us-east-2c"
#  cidr_block = "172.30.2.0/24"
#  map_public_ip_on_launch = "true"
#  tags { 
#    Name = "moluccan2-Pub3"
#  }
#}

#resource "aws_subnet" "moluccan2-Pri1" {
#  vpc_id = "${aws_vpc.moluccan2.id}"
#  availability_zone = "us-east-2a"
#  map_public_ip_on_launch = "false"
#  cidr_block = "172.30.3.0/24"
#  tags { 
#    Name = "moluccan2-Pri1"
#  }
#}

#resource "aws_subnet" "moluccan2-Pri2" {
#  vpc_id = "${aws_vpc.moluccan2.id}"
#  availability_zone = "us-east-2b"
#  map_public_ip_on_launch = "false"
#   cidr_block = "172.30.4.0/24"
#  tags { 
#    Name = "moluccan2-Pri2"
#  }
#}

#resource "aws_subnet" "moluccan2-Pri3" {
#  vpc_id = "${aws_vpc.moluccan2.id}"
#  availability_zone = "us-east-2c"
#  map_public_ip_on_launch = "false"
#   cidr_block = "172.30.5.0/24"
#  tags { 
#    Name = "moluccan2-Pri3"
#  }
#}

resource "aws_internet_gateway" "moluccan2" {
  vpc_id = "${aws_vpc.moluccan2.id}"
  tags { 
    Name = "moluccan2"
  }
}

resource "aws_route_table" "moluccan2" {
  vpc_id = "${aws_vpc.moluccan2.id}"
  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = "${aws_internet_gateway.moluccan2.id}"
  }
  tags { 
    Name = "moluccan2"
  }
}

resource "aws_route_table_association" "moluccan2-Pub1" {
  subnet_id = "${aws_subnet.moluccan2-Pub1.id}"
  route_table_id = "${aws_route_table.moluccan2.id}"
}
resource "aws_route_table_association" "moluccan2-Pub2" {
  subnet_id = "${aws_subnet.moluccan2-Pub2.id}"
  route_table_id = "${aws_route_table.moluccan2.id}"
}
resource "aws_route_table_association" "moluccan2-Pub3" {
  subnet_id = "${aws_subnet.moluccan2-Pub3.id}"
  route_table_id = "${aws_route_table.moluccan2.id}"
}
  
resource aws_network_acl "moluccan2" {
  vpc_id = "${aws_vpc.moluccan2.id}"
  subnet_ids = ["${aws_subnet.moluccan2-Pub1.id}","${aws_subnet.moluccan2-Pub2.id}","${aws_subnet.moluccan2-Pub3.id}"]
  ingress {
    rule_no = 101
	from_port = 0
    to_port = 0
    protocol = -1
	action = "allow"
    cidr_block = "0.0.0.0/0"
  }

  # Allow all outbound traffic.
  egress {
    rule_no = 201
	from_port = 0
    to_port = 0
	action = "allow"
    protocol = -1
    cidr_block = "0.0.0.0/0"
  }

  tags { 
    Name = "moluccan2"
  }
}