For auto fill vars we can create files with names:
* terraform.tfvars  (if we have only this file)
* filename.tfvars (dev.tfvars, prod.tfvars)

To apply this we have to set *tfvars file from which one we want to set variables:

terraform apply -var-file="prod.tfvars"