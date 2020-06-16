# Security Group HTTP
resource "aws_security_group" "allow_http" {
  name        = "allow_http_s"
  description = "Allow http_s inbound traffic"
  vpc_id      = aws_vpc.mainvpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-http_s-sg"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "Allow ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.mainvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh-sh"
  }
}

resource "aws_security_group" "allow_icmp" {
  name        = "allow_icmp"
  description = "Allow icmp inbound traffic"
  vpc_id      = aws_vpc.mainvpc.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-icmp-sg"
  }
}

# ALLOW through ELB
resource "aws_security_group" "elb_http_ssh_mysql" {
  name        = "elb_http_ssh_mysql"
  description = "Allow HTTP, SSH, MySQL traffic to instances through Elastic Load Balancer"
  vpc_id      = aws_vpc.mainvpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow HTTP, SSH, MySQL, icmp through ELB Security Group"
  }
}

# Launch config sg
resource "aws_security_group" "allow_ssh_icmp_private" {
  name        = "Allow ssh and icmp from remote instance"
  description = "Allow ssh, icmp from remote instance"
  vpc_id      = aws_vpc.mainvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.3.0/24"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.3.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh-icmp-from-remote"
  }
}
