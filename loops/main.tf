resource "aws_iam_user" "users" {
  count = length(var.aws_users)
  name  = element(var.aws_users, count.index)
}

resource "aws_instance" "servers" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.latest_amazon_linux.id
  count         = 3
  tags = {
    "Name" = "Server number: ${count.index + 1}"
  }

}
