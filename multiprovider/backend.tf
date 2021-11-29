terraform {
  backend "s3" {
    bucket = "farid-terraform-state-files"
    key    = "terraform/multiprovider-state"
    region = "us-west-2"
  }
}
