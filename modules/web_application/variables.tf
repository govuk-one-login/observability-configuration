variable "hostname" {
}

variable "name" {
}

variable "enabled" {
  type    = bool
  default = true
}

variable "opt_in_enabled" {
  type    = bool
  default = true
}

variable "manual_injection" {
  type = bool
}

variable "user_session_percentage" {
  type = number
}