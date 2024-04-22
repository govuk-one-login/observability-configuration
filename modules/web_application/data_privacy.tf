resource "dynatrace_data_privacy" "web_application" {
  application_id = dynatrace_web_application.web_application.id
  data_collection {
    opt_in_mode_enabled = var.opt_in_enabled
  }
  do_not_track {
    comply_with_do_not_track = true
    do_not_track             = "anonymous"
  }
  masking {
    personal_data_uri_masking_enabled = true
    user_action_masking_enabled       = false
  }
  user_tracking {
    persistent_cookie_enabled = true
  }
}
