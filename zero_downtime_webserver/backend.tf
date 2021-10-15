terraform {
  backend "s3" {
    bucket = "farid-terraform-state-files"
    key    = "terraform/zero-downtime-state"
    region = "us-west-2"
  }
}