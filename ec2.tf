
resource "aws_instance" "webserver1" {
  ami                    = "ami-0651a24cc46a968a0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg1.id]
  availability_zone      = "us-east-1a"
  subnet_id              = aws_subnet.pubsubaz1.id
  user_data              = file("code.sh")
  tags = {
    Name = "webserver1"
  }

}

resource "aws_instance" "webserver2" {
  ami                    = "ami-0651a24cc46a968a0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg1.id]
  availability_zone      = "us-east-1b"
  subnet_id              = aws_subnet.pubsubaz2.id
  user_data              = file("code.sh")
  tags = {
    Name = "webserver2"
  }

}


  