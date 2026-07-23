resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.employee_vpc.id

  tags = {
    Name = "Employee-Portal-IGW"
  }
}
