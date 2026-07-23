# Web Server
resource "aws_instance" "web_server" {

  ami = "ami-0f918f7e67a3323f0"

  instance_type = "t3.micro"

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  key_name = "MyTest-Key"

  associate_public_ip_address = true

  tags = {
    Name = "Employee-Web-Server"
  }
}

# Database Server
resource "aws_instance" "database_server" {

  ami = "ami-0f918f7e67a3323f0"

  instance_type = "t3.micro"

  subnet_id = aws_subnet.private_subnet.id

  vpc_security_group_ids = [
    aws_security_group.database_sg.id
  ]

  key_name = "MyTest-Key"

  associate_public_ip_address = false

  tags = {
    Name = "Employee-Database-Server"
  }
}
