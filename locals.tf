locals {
  accounts = { for account in csvdecode(file("${path.module}/accounts.csv")) : account.name => account }

  aws_environments = var.environment == "production" ? ["production"] : ["build", "staging", "integration"]
  is_production = contains(local.aws_environments, terraform.workspace)
}
