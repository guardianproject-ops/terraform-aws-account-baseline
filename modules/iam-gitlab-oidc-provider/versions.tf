terraform {
  required_version = ">= 1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.78.0"
    }
      tls = {
      source  = "hashicorp/tls"
      version = ">=3.0"
    }
  }
}
