

# enable apis
resource "google_project_service" "enable_pre_apis" {
  for_each = toset(var.pre_api_list)
  project  = var.project_id
  service  = each.key
}

# create bucket 
resource "google_storage_bucket" "terraform_backend_bucket" {
  name          = var.backend_bucket_name
  location      = var.region
  force_destroy = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365
    }
  }

  depends_on = [google_project_service.enable_pre_apis]
}

# create service account
resource "google_service_account" "workload_identity_sa" {
  account_id   = var.wi_sa_id
  display_name = "WI Service Account"

  depends_on = [google_project_service.enable_pre_apis]
}

# create WI pool
resource "google_iam_workload_identity_pool" "github_pool" {
  provider                  = google-beta
  workload_identity_pool_id = var.wi_pool_id
  display_name              = "My WI Pool"
  description               = "My Workload Identity Pool"

  depends_on = [google_project_service.enable_pre_apis]
}

# create WI provider
resource "google_iam_workload_identity_pool_provider" "github_provider" {
  provider = google-beta

  workload_identity_pool_id         = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.wi_provider_id
  display_name                      = "My WI Pool Provider"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

  # Specify the condition to match GitHub's repository claim
  attribute_condition = "attribute.repository == '${var.github_repository}'"

  depends_on = [google_project_service.enable_pre_apis]
}


# bind the service account with workload Identity
resource "google_service_account_iam_binding" "workload_identity_binding" {
  service_account_id = google_service_account.workload_identity_sa.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository/${var.github_repository}"
  ]

  depends_on = [google_project_service.enable_pre_apis]
}

# bind the service account with roles for CICD
resource "google_project_iam_member" "cloud_build_sa_roles" {
  for_each = toset(var.wi_sa_roles)  # Convert the list to a set to iterate over
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.workload_identity_sa.email}"

  depends_on = [google_project_service.enable_pre_apis]
}


# cloud build trigger
module "network" {
  source         = "../modules/cloudbuild_trigger"
  project_id = var.project_id
  github_oauth_client_id = "Ov23liH3g2zUtTuvzYBp"
  github_oauth_client_secret = "40740ca0a1bc46520b836ce20f7926f63308a115"

}
