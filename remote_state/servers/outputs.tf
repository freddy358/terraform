output "webserver_sg_id" {
    value = aws_security_group.webserver.id
}

output "webserver_public_ip" {
    value = aws_instance.webserver.public_ip
}