output "server_instance_id" {
  value = aws_instance.my_server.id
}

output "public_ip_address" {
  value = aws_eip.my_static_ip.public_ip
}

output "security_group_id" {
  value = aws_security_group.my_server.id
}

output "security_group_arn" {
  value = aws_security_group.my_server.arn
}