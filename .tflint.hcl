plugin "aws" {
    enabled = true
    version = "0.38.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "aws_provider_missing_default_tags" {
  enabled = true
  tags = [
    "Owner",
    "System",
    "Environment",
    "Product"
  ]
}
