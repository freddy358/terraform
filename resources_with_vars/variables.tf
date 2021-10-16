variable "region" {
  description = "Please enter AWS region to deploy"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "Enter instance type"
  type        = string
  default     = "t2.micro"
}

variable "allow_ports" {
  description = "List of ports to open"
  type        = list(any)
  default     = ["80", "443"]
}

variable "enable_monitoring" {
  description = "Enable detailed monitoring"
  type        = bool
  default     = "true"
}

variable "common_tags" {
  description = "Common Tags for all resources"
  type        = map(any)
  default = {
    Project     = "TerraVars"
    Owner       = "Farid Bakhishli"
    Environment = "Prod"
  }
}
