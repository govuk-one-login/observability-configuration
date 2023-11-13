locals {
  accounts = { for account in csvdecode(file("${path.module}/accounts.csv")) : account.name => account }
}
