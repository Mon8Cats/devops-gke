# modules/cloud_build_trigger/outputs.tf

output "trigger_id" {
  description = "ID of the created Cloud Build trigger"
  value       = google_cloudbuild_trigger.github_trigger.id
}

output "trigger_url" {
  description = "URL of the created Cloud Build trigger in GCP Console"
  value       = "https://console.cloud.google.com/cloud-build/triggers/edit/${google_cloudbuild_trigger.github_trigger.id}"
}
