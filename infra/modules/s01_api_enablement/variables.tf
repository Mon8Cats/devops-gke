# modules/api_enablement/variables.tf

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "api_list" {
  description = "A list of APIs to enable"
  type        = set(string)
  default     = [
    "cloudbuild.googleapis.com",       # Cloud Build API
    "artifactregistry.googleapis.com", # Artifact Registry API
    "iam.googleapis.com",              # IAM API
    "compute.googleapis.com",          # Compute Engine API
    "run.googleapis.com",              # Cloud Run API
    "cloudfunctions.googleapis.com",   # Cloud Functions API
    "container.googleapis.com",        # Kubernetes Engine API
    "appengine.googleapis.com",        # App Engine Admin API
    "cloudresourcemanager.googleapis.com", # Resource Manager API
    "iamcredentials.googleapis.com"
  ]
}
