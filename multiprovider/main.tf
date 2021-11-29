resource "aws_instance" "default_servers" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.latest_amazon_linux.id
  tags = {
    "Name" = "Default server"
  }

}

resource "aws_instance" "us_server" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.latest_amazon_linux_usa.id
  provider      = aws.USA
  tags = {
    "Name" = "US Server"
  }
}

resource "aws_instance" "eu_server" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.latest_amazon_linux_ger.id
  provider      = aws.GER
  tags = {
    "Name" = "Germany Server"
  }
}
