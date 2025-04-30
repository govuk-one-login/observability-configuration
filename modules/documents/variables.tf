variable "document_path" {
  description = "The path of the document JSON file, relative to documents/"
}

variable "document_name" {
    description = "This is the name of the document, as seen within the Dynatrace UI"
}

variable "document_type" {
    description = "Must be one of dashboard, launchpad or notebook"
}
