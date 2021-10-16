# Auto fill parameters for dev env

region            = "us-west-2"
instance_type     = "t2.micro"
enable_monitoring = true

common_tags = {
  Environment = "develop"
  Owner       = "Farid Bakhishli"
  Project     = "DevTerraVars"
}
