# Terraform Settings Block
terraform {
    required_version = "= 1.9>"
    required_providers {
      google = {
        source = "hashicorp/google"
        version = ">= 5.40.0"
      }
    }

    backend "gcs" {
        bucket = "devops-gke"
        prefix = "dev/gke-cluster"
      
    }
}