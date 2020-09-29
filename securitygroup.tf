resource "aws_security_group" "myinstance-blue" {
  vpc_id      = aws_vpc.blue-vpc.id
  name        = "myinstance-blue"
  description = "security group for blue deployment instance"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.elb-securitygroup-blue.id]
  }

  tags = {
    Name = "myinstance-blue-deployment"
  }
}

resource "aws_security_group" "elb-securitygroup-blue" {
  vpc_id      = aws_vpc.blue-vpc.id
  name        = "elb-blue"
  description = "security group for load balancer for blue-deployment"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "elb-blue"
  }
}