data "dynatrace_iam_group" "all" {
  name = "all"
}

data "dynatrace_iam_group" "observability" {
  name = "observability"
}

data "dynatrace_iam_group" "service-operations" {
  name = "service-operations"
}
