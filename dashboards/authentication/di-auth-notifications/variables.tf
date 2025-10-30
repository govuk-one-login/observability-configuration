variable "application_environment" {
  description = "Environment of the application"
}

variable "auth_account_ids" {
  description = "List of AWS Account IDs"
  type        = list(string)
}
