
resource "aws_instance" "unsecured-server" {
  ami                    = "ami-0d7a109bf30624c99"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.unrestricted.id]
  key_name               = "security-demo"
  subnet_id = "subnet-cf91b8a8"

  tags = {
    Name = "unsecured-Server"
  }
}



resource "aws_security_group" "unrestricted" {
  name        = "unrestricted"
  description = "Allow  inbound traffic from all"
  vpc_id      = "vpc-b3f4b1c9"

  tags = {
    Name = "unrestricted"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_unrestricted" {
  security_group_id = aws_security_group.unrestricted.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

