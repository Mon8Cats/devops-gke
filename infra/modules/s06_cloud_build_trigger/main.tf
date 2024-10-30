# modules/cloud_build_trigger/main.tf


resource "google_cloudbuild_trigger" "github_trigger" {
  name        = var.trigger_name
  description = var.description
  filename    = var.build_config_file
  location = "global"
  service_account = var.service_account_id

  trigger_template {
    branch_name = var.branch_regex
    repo_name   = var.github_repo
  }
}
