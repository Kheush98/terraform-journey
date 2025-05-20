resource "aws_security_group" "dove_sg" {
  name        = "dove-sg"
  description = "dove-sg"

  tags = {
    name = "dove"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sshFromMyIP" {
  security_group_id = aws_security_group.dove_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allowHttp" {
  security_group_id = aws_security_group.dove_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_trafic_ipv4" {
  security_group_id = aws_security_group.dove_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_trafic_ipv6" {
  security_group_id = aws_security_group.dove_sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}