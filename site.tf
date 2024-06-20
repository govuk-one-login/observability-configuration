terraform {
  required_providers {
    dynatrace = {
      source  = "dynatrace-oss/dynatrace"
      version = "1.58.5"
    }
  }

  backend "s3" {
    bucket = "di-observability-tfstate"
    key    = "configuration.tfstate"
    region = "eu-west-2"
  }
}
