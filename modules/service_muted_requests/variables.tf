variable "muted_requests_service_id" {
  description = "The ID of the Service that the muted requests should be applied to"
}

variable "muted_requests_names" {
  description = "A set of values to be marked as muted requests against the Service"
  type        = set(string)
}
