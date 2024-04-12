variable "name" {
  type        = string
  description = "Rule name"
}

variable "url" {
  type        = string
  description = "URL host name"
}

variable "conditions_attribute" {
  type        = string
  description = "Take the value of this attribute"
  default     = "HostName"
}

variable "conditions_compare_operation_type" {
  type        = string
  description = ""
  default     = "StringEndsWith"
}

variable "port_for_service_id" {
  type        = bool
  description = "Let the port contribute to the Service Id"
  default     = false
}

variable "application_id_enable_id_contributor" {
  type        = bool
  description = "Transform this value before letting it contribute to the Service Id"
  default     = false
}

variable "context_root_enable_id_contributor" {
  type        = bool
  description = "Transform this value before letting it contribute to the Service Id"
  default     = false
}

variable "public_domain_name_enable_id_contributor" {
  type        = bool
  description = "Transform this value before letting it contribute to the Service Id"
  default     = true
}

variable "public_domain_name_contribution_type" {
  type        = string
  description = "Defines whether the original value should be used or if a transformation set should be used to override a value or transform it."
  default     = "OriginalValue"
}

variable "public_domain_name_copy_from_host_name" {
  type        = bool
  description = "Use the detected host name instead of the request's domain name."
  default     = true
}
