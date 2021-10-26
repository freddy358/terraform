output "creted_iam_users_all" {
    value = aws_iam_user.users[*].id
}

output "created_iam_users_custom" {
    value = [
        for user in aws_iam_user.users:
        "Hello. Username: ${user.name}, arn: ${user.arn}"
    ]
}

output "created_iam_users_map" {
    value = {
        for user in aws_iam_user.users:
        user.unique_id => user.id
    }
}

output "custom_if_lenght" {
    value = [
        for user in aws_iam_user.users:
        user.name
        if length(user.name) == 4
    ]
}

output "servers" {
    value = {
        for server in aws_instance.servers:
        server.id => server.public_ip
    }
}