resource "null_resource" "command1" {
  provisioner "local-exec" {
    command = "echo Terraform START: $(date) >>log.txt"
  }
}

resource "null_resource" "command2" {
  provisioner "local-exec" {
    command = "ping -c 5 www.google.com"
  }
}

resource "null_resource" "command3" {
  provisioner "local-exec" {
    command     = "print('Hello World!')"
    interpreter = ["python3", "-c"]
  }
}

resource "null_resource" "command4" {
  provisioner "local-exec" {
    command = "echo $NAME1 $NAME2 $NAME3 $NAME4 >> names.txt"
    environment = {
      NAME1 = "Rick"
      NAME2 = "Morty"
      NAME3 = "Summer"
    }
  }
}

resource "aws_instance" "myserver" {
  ami = "ami-0c2d06d50ce30b442"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo Hello from AWS instance"
  }
}

resource "null_resource" "command5" {
  provisioner "local-exec" {
    command = "echo Terraform END: $(date) >>log.txt"
  }
  depends_on = [
    null_resource.command1, null_resource.command2, null_resource.command3, null_resource.command4
  ]
}
