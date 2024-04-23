module "web_application_staging" {
  count  = var.environment == "nonproduction" ? 1 : 0
  source = "./modules/web_application"

  hostname       = "staging.account.gov.uk"
  opt_in_enabled = false
}

moved {
  from = module.web_application_signin_staging
  to   = module.web_application_staging
}
