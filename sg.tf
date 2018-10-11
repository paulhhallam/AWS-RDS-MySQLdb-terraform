resource "aws_security_group" "moluccan2" {
  name = "moluccan2"
  description = "RDS db servers (terraform-managed)"
  vpc_id = "${aws_vpc.moluccan2.id}"
  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags { 
    Name = "moluccan2"
  }
}

