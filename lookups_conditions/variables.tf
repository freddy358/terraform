variable "region" {
  description = "Please enter AWS region to deploy"
  type        = string
  default     = "us-west-2"
}


variable "env" {
  default = "dev"
}


variable "ec2_size" {
  default = {
    "prod"    = "t3.medium"
    "dev"     = "t3.micro"
    "staging" = "t3.small"
  }
}

variable "allow_ports_list" {
    default = {
        "prod" = ["80", "443"]
        "dev" = ["80", "443", "8080", "22"]
    }
}
variable "prod_owner" {
  default = "Farid Bakhishli"
}

variable "non_prod_owner" {
  default = "Rick Sanchez"
}
