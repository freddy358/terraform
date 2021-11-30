terraform {
  backend "s3" {
    bucket = "farid-terraform-state-files"
    key    = "terraform/remote-state"
    region = "us-west-2"
  }
}