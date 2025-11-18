variable "environment" {
}

variable "metrics_cost" {
  type = number
}

variable "full_stack_cost" {
  type = number
}

variable "serverless_cost" {
  type = number
}

variable "synthetic_actions_cost" {
  type = number
}

variable "synthetic_requests_cost" {
  type = number
}

variable "team_account_id" {
  type = string
}

variable "key_requests_from_date" {
  default = "now-30d"
}
