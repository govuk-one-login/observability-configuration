variable "path" {
  description = "The path of the dashboard JSON file, relative to dashboards/"
}

variable "service_name" {
  description = "The name of the service in ECS"
}

variable "apigwid" {
  description = "The id of the API GW, provided as a mapping"
}