# ---------------------------------------------------------------------------------------------------------------------
# PIN TERRAFORM VERSION TO >= 0.12
# The examples have been upgraded to 0.12 syntax
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.29"
  backend "local" {
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 3.12.0"
    }
  }
}
