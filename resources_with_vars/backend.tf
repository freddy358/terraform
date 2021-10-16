terraform {
  backend "s3" {
    bucket = "farid-terraform-state-files"
    key    = "terraform/with-vars-state"
    region = "us-west-2"
  }
}
