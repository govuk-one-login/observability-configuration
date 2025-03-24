variable "hostname" {
  description = "This value is used as part of the domain name for each RUM application"
}

variable "name" {
  description = "This is the name of the RUM application as seen within the Dynatrace UI"
}

variable "enabled" {
  description = "This determines whether RUM is enabled or not for the respective application"
  type        = bool
  default     = true
}

variable "opt_in_enabled" {
  description = "This is used as part of the data privacy for RUM and cookie consent setup"
  type        = bool
  default     = true
}

variable "user_session_percentage" {
  description = "This variable controls the number of sessions captured within each RUM application"
  type        = number
}

variable "injection_rule" {
  description = "The rule for determining how the RUM javascript should be injected"
}

variable "injection_operator" {
  description = "The URL operator for determining where the RUM javascript should be injected"
}
