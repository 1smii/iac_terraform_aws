resource "aws_vpc" "mainvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "Main-vpc"
  }
}

# Subnet privada 1 (eu-west-3a)
resource "aws_subnet" "private-subnet1" {
  vpc_id            = aws_vpc.mainvpc.id
  availability_zone = var.zone_a
  cidr_block        = var.private-subnet1-cidr

  tags = {
    Nmae = "Subnet privada1"
  }
}

# Subnet privada 2 (eu-west-3b)
resource "aws_subnet" "private-subnet2" {
  vpc_id            = aws_vpc.mainvpc.id
  availability_zone = var.zone_b
  cidr_block        = var.private-subnet2-cidr

  tags = {
    Nmae = "Subnet privada2"
  }
}

# Subnet publica 1 (eu-west-3a)
resource "aws_subnet" "public-subnet1" {
  vpc_id                  = aws_vpc.mainvpc.id
  availability_zone       = var.zone_a
  cidr_block              = var.public-subnet1-cidr
  map_public_ip_on_launch = true # auto-assing public ip
  tags = {
    Name = "Public subnet1"
  }
}

# Subnet publica 2 (eu-west-3b)
resource "aws_subnet" "public-subnet2" {
  vpc_id                  = aws_vpc.mainvpc.id
  availability_zone       = var.zone_b
  cidr_block              = var.public-subnet2-cidr
  map_public_ip_on_launch = true # auto-assing public ip
  tags = {
    Name = "Public subnet2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "Main internet gateway"
  }
}

# Tabla de rutas para la subred pública 1
resource "aws_route_table" "route-table-public-subnet1" {
  vpc_id = aws_vpc.mainvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Route table public subnet1"
  }
}

resource "aws_route_table_association" "route-table-association-public-subnet1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.route-table-public-subnet1.id
}

# Tabla de rutas para la subred pública 2
resource "aws_route_table" "route-table-public-subnet2" {
  vpc_id = aws_vpc.mainvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Route table public subnet 2"
  }
}

resource "aws_route_table_association" "route-table-association-public-subnet2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.route-table-public-subnet2.id
}

# Tabla de rutas para la subred privada 1 
resource "aws_route_table" "route-table-private-subnet1" {
  vpc_id = aws_vpc.mainvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = "route-table-private-subnet1"
  }
}

resource "aws_route_table_association" "route-table-association-private-subnet1" {
  subnet_id      = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.route-table-private-subnet1.id
}

# Tabla de rutas para la subred privada 2 
resource "aws_route_table" "route-table-private-subnet2" {
  vpc_id = aws_vpc.mainvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = "route-table-private-subnet2"
  }
}
resource "aws_route_table_association" "route-table-association-private-subnet2" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.route-table-private-subnet2.id
}

# Elastic IP para el NAT Gateway
resource "aws_eip" "eip" {
  vpc = true
  tags = {
    Name = "Elastic ip para nat-gw"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-subnet2.id

  tags = {
    Name = "Nat gateway"
  }
}
