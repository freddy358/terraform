variable "region" {
  description = "Please enter AWS region to deploy"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "env" {
  default = "dev"
}

variable "public_subet_cidrs" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}