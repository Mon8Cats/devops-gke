# modules/cicd_service_account/outputs.tf

output "service_account_email" {
  description = "Email of the created CI/CD service account"
  value       = google_service_account.cicd.email
}
