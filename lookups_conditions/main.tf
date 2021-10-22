resource "aws_instance" "webserver" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.env == "prod" ? "t2.large" : "t2.micro"

  tags = {
    Name  = "${var.env}-server"
    Owner = var.env == "prod" ? var.prod_owner : var.non_prod_owner
  }
}

resource "aws_instance" "dev_bastion_erver" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
  count         = var.env == "dev" ? 1 : 0
  tags = {
    Name = "Bastion Server for Dev environment"
  }
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = lookup(var.ec2_size, var.env)

}

resource "aws_security_group" "my_sg" {
  name = "My security group"

  dynamic "ingress" {
    for_each = lookup(var.allow_ports_list, var.env)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

}