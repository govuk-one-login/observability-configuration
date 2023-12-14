module "oidc-jwks-monitor" {
  for_each = toset(var.environment == "production" ? [
    "api.identity.account.gov.uk",
    "api-backend-api.review-b.account.gov.uk",
    "oidc.account.gov.uk"
    ] : flatten([for env in local.aws_environments : [
      "api.identity.${env}.account.gov.uk",
      "api-backend-api.review-b.${env}.account.gov.uk",
      "oidc.${env}.account.gov.uk"
  ]]))

  source      = "./modules/monitors/jwks"
  domain_name = each.value
}

module "signin-browser-monitor" {
  source = "./modules/monitors/sign-in"

  domain_name              = var.environment == "production" ? "home.account.gov.uk" : "home.integration.account.gov.uk"
  environment              = var.environment == "production" ? "production" : "integration"
  use_basic_authentication = var.environment != "production"
}
