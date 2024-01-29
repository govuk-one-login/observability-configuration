resource "dynatrace_ownership_config" "owner" {
  ownership_identifiers {
    ownership_identifier {
      enabled = true
      key     = "dt.owner"
    }
    ownership_identifier {
      enabled = true
      key     = "owner"
    }
  }
}