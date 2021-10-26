terraform {
  backend "s3" {
    bucket = "farid-terraform-state-files"
    key    = "terraform/loops-state"
    region = "us-west-2"
  }
}
