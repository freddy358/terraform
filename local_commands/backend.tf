terraform {
  backend "s3" {
    bucket = "farid-terraform-state-files"
    key    = "terraform/local-commands-state"
    region = "us-west-2"
  }
}
