terraform {
  backend "s3" {
    bucket = "farid-terraform-state-files"
    key    = "terraform/module-state"
    region = "us-west-2"
  }
}