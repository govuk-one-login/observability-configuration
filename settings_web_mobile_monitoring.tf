# Not in use - Source maps and symbol files

# User experience score 
resource "dynatrace_user_experience_score" "user_experience_score" {
  consider_last_action                  = true
  consider_rage_click                   = true
  max_frustrated_user_actions_threshold = 30
  min_satisfied_user_actions_threshold  = 50
}

# Usability analytics
