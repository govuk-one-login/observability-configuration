module "web_application_signin_staging" {
  count  = var.environment == "nonproduction" ? 1 : 0
  source = "./modules/web_application"

  hostname       = "signin.staging.account.gov.uk"
  opt_in_enabled = false
}
