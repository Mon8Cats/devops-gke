provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_artifact_registry_repository" "myapps_repository" {
  repository_id       = var.repository_name
  format     = var.repository_format
  location   = var.region
  mode       = var.repository_mode
  description = "Artifact registry for storing docker images"
}
