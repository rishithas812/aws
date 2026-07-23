# Web Security Group
resource "aws_security_group" "web_sg" {

  name = "Web-SG"

  vpc_id = aws_vpc.employee_vpc.id

  ingress {
    description = "SSH Access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Flask App"
    from_port = 5000
    to_port = 5000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-SG"
  }
}

# Database Security Group
resource "aws_security_group" "database_sg" {

  name = "Database-SG"

  vpc_id = aws_vpc.employee_vpc.id

  ingress {
    description = "MariaDB Access"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"

    security_groups = [
      aws_security_group.web_sg.id
    ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database-SG"
  }
}
