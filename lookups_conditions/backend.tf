terraform {
  backend "s3" {
    bucket = "farid-terraform-state-files"
    key    = "terraform/lookups-conditions-state"
    region = "us-west-2"
  }
}
