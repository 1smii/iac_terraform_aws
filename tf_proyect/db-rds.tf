resource "aws_db_subnet_group" "subnet-association-rds" {
  name       = "main_rds_association"
  subnet_ids = [aws_subnet.private-subnet1.id, aws_subnet.private-subnet2.id]

  tags = {
    Name = "My db subnet group"
  }
}

resource "aws_db_instance" "main-rds" {
  identifier = "aws-rds"

  # Settigns
  engine         = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"

  # DB Settings
  name     = "replic_micms"
  username = "nazgul13"
  password = "iacproyect"
  port     = "3306"

  # Network Settings
  publicly_accessible    = false
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.subnet-association-rds.name
  vpc_security_group_ids = [aws_security_group.elb_http_ssh_mysql.id]

  # Storage settings
  allocated_storage     = 20
  max_allocated_storage = 50
  storage_type          = "gp2"
  skip_final_snapshot   = true

  tags = {
    Name = "DB-for-web-server"
  }
}
