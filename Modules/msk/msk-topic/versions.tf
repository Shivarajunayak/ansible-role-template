terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.21"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6"
    }
    kafka = {
      source  = "Mongey/kafka"
      version = "~> 0.8.1" 
    }
  }
}
