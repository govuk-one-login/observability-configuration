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
