terraform {
  backend "s3" {
    bucket = "farid-terraform-state-files"
    key    = "terraform/create-store-passws-ssm-state"
    region = "us-west-2"
  }
}
