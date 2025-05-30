variable "key_requests_service" {
  description = "The ID of the Service that the key requests should be applied to"
}

variable "key_requests_names" {
  description = "A set of values to be marked as key requests against the Service"
  type        = set(string)
}
