
resource "aws_instance" "secure-server" {
  ami                    = "ami-0d7a109bf30624c99"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.restricted.id]
  key_name               = "security-demo"
  subnet_id = "subnet-cf91b8a8"

  tags = {
    Name = "Secure-Server"
  }

  #switch during demo
  iam_instance_profile = aws_iam_instance_profile.properlyprovisioned_profile.name
  #iam_instance_profile = aws_iam_instance_profile.overprovisioned_profile.name
}



resource "aws_security_group" "restricted" {
  name        = "restricted"
  description = "Allow  inbound traffic from known IP"
  vpc_id      = "vpc-b3f4b1c9"

  tags = {
    Name = "restricted"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_restricted" {
  security_group_id = aws_security_group.restricted.id
  cidr_ipv4         = var.allowed-ip
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_outgoing" {
  security_group_id = aws_security_group.restricted.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  ip_protocol       = "-1"
  to_port           = 0
}