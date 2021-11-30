resource "aws_security_group" "webserver" {
    name = "WebServer Security Group"
    vpc_id = data.terraform_remote_state.network.outputs.vpc_id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [data.terraform_remote_state.network.outputs.vpc_cidr]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "webserver-sg"
        Owner = "Farid Bakhishli"
    }
}

resource "aws_instance" "webserver" {
    ami                    = data.aws_ami.latest_amazon_linux.id
    instance_type          = "t2.micro"
    vpc_security_group_ids = [aws_security_group.webserver.id]
    subnet_id              = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
    user_data              = "${file("user_data.sh")}"
    tags = {
        Name = "WebServer"
    }
}