locals {
  full_owner_project_name = "${var.common_tags["Owner"]}-${var.common_tags["Project"]}"
  az_list                 = join(",", data.aws_availability_zones.available.names)
  region                  = data.aws_region.current.description
  location                = "In ${local.region} there are AZ: ${local.az_list}"
}


resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_server.id
  tags     = merge(var.common_tags, { Name = "${var.common_tags["Environment"]} ServerIP" }, { FullName = "${local.full_owner_project_name}" }, { region_azs = "${local.az_list}" }, { Location = "${local.location}" })
}

resource "aws_instance" "my_server" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_server.id]
  monitoring             = var.enable_monitoring

  tags = merge(var.common_tags, { Name = "${var.common_tags["Environment"]} Server" }, { FullName = "${local.full_owner_project_name}" }, { region_azs = "${local.az_list}" }, { Location = "${local.location}" })
}

resource "aws_security_group" "my_server" {
  name = "My security group"

  dynamic "ingress" {
    for_each = var.allow_ports
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

  tags = merge(var.common_tags, { Name = "${var.common_tags["Environment"]} SG" }, { FullName = "${local.full_owner_project_name}" }, { region_azs = "${local.az_list}" }, { Location = "${local.location}" })
}
