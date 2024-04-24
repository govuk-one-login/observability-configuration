locals {
  one_login_subdomains = [
    "signin",
    "home",
    "identity",
    "review-a",
    "review-b",
    "review-bav",
    "review-c",
    "review-d",
    "review-f",
    "review-hc",
    "review-k",
    "review-o",
    "review-pa"
  ]
}

module "web_application_staging" {
  count  = var.environment == "nonproduction" ? 1 : 0
  source = "./modules/web_application"

  hostname       = "staging.account.gov.uk"
  opt_in_enabled = false
}

module "web_application_staging_subdomains" {
  for_each = var.environment == "nonproduction" ? [] : toset(local.one_login_subdomains)
  source   = "./modules/web_application"

  hostname       = "${each.key}.staging.account.gov.uk"
  opt_in_enabled = false
}
