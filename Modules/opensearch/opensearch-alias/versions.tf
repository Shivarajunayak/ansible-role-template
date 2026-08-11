terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.21"
    }
    opensearch = {
      source = "opensearch-project/opensearch"
      version = ">= 2.3.1"
    }
  }
}