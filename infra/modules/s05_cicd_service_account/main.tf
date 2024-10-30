
# modules/cicd_service_account/main.tf

resource "google_service_account" "cicd" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

# Assign roles to the service account
resource "google_project_iam_member" "cicd_roles" {
  for_each = toset(var.roles)
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.cicd.email}"
}

# Allow Cloud Build service account to impersonate the CI/CD service account
resource "google_service_account_iam_member" "cloud_build_impersonate" {
  service_account_id = google_service_account.cicd.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
}

# Bind service account to use workload identity pool
resource "google_service_account_iam_member" "workload_identity_binding" {
  service_account_id = google_service_account.cicd.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${var.workload_identity_pool_id}/attribute.repository/${var.github_repository}"
}
