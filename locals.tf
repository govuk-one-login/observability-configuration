locals {
  accounts          = { for account in csvdecode(file("${path.module}/accounts.csv")) : account.name => account }
  oneagent_features = { for oneagent_features in csvdecode(file("${path.module}/support_files/oneagent_features.csv")) : oneagent_features.key => oneagent_features }

  aws_environments = var.environment == "production" ? ["production"] : ["build", "staging", "integration"]
  is_production    = contains(local.aws_environments, terraform.workspace)
}
