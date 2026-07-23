output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "database_server_private_ip" {
  value = aws_instance.database_server.private_ip
}
