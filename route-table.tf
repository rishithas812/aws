# Public Route Table
resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.employee_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-Route-Table"
  }
}

resource "aws_route_table_association" "public_assoc" {

  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_rt.id
}

# Elastic IP
resource "aws_eip" "nat_eip" {

  domain = "vpc"

  tags = {
    Name = "NAT-EIP"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "Employee-NAT-Gateway"
  }

  depends_on = [
    aws_internet_gateway.igw
  ]
}

# Private Route Table
resource "aws_route_table" "private_rt" {

  vpc_id = aws_vpc.employee_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "Private-Route-Table"
  }
}

resource "aws_route_table_association" "private_assoc" {

  subnet_id = aws_subnet.private_subnet.id

  route_table_id = aws_route_table.private_rt.id
}
