variable "authentication_account_id" {
  description = "ID for the new Authentication AWS account"
}

variable "api_account_id" {
  description = "ID for the Auth API AWS account"
}

variable "check_account_id" {
  description = "ID for the Auth Check Experian AWS account"
}

variable "application_environment" {
  description = "Environment of the application within the Auth Check Experian AWS account"
}
