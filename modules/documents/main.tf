resource "dynatrace_document" "main" {
  type    = var.document_type
  name    = var.document_name
  content = file("./documents/${var.document_path}")
}

data "dynatrace_iam_group" "all" {
  name = "all"
}

resource "dynatrace_direct_shares" "main" {
  document_id = dynatrace_document.main.id
  access      = "read"
  recipients {
    recipient {
      id   = data.dynatrace_iam_group.all.id
      type = "group"
    }
  }
}
