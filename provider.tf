terraform {
  required_version = "~> 1.7"

  required_providers {
    dynatrace = {
      source  = "dynatrace-oss/dynatrace"
      version = "~> 1.62"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.30"
    }
  }

  backend "s3" {
    bucket = "di-observability-tfstate"
    key    = "configuration.tfstate"
    region = "eu-west-2"
  }
}
