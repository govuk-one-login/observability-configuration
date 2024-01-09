terraform {
  required_providers {
    dynatrace = {
      source  = "dynatrace-oss/dynatrace"
      version = "1.48.1"
    }
  }

  backend "s3" {
    bucket = "di-observability-tfstate"
    key    = "configuration.tfstate"
    region = "eu-west-2"
  }
}
