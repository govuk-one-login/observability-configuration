resource "dynatrace_business_events_buckets" "business_events_buckets" {
  enabled     = false
  bucket_name = "default_bizevents"
  matcher     = "*"
  rule_name   = "default"
}