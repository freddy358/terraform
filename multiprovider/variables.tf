variable "region" {
  description = "Please enter AWS region to deploy"
  type        = string
  default     = "us-west-2"
}


variable "aws_users" {
  description = "List of IAM users"
  default     = ["rick", "morty", "summer", "jerry"]
}
