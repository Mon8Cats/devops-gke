# environments/dev/terraform.tfvars

project_id = "mon-devops-gke"
project_number = "57251267171"
region     = "us-central1"

pre_api_list   = [
    "storage.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "cloudbuild.googleapis.com",
    "artifactregistry.googleapis.com"

    #"cloudbuild.googleapis.com",       # Cloud Build API
    #"artifactregistry.googleapis.com", # Artifact Registry API
    #"iam.googleapis.com",              # IAM API
    #"compute.googleapis.com",          # Compute Engine API
    #"run.googleapis.com",              # Cloud Run API
    #"cloudfunctions.googleapis.com",   # Cloud Functions API
    #"container.googleapis.com",        # Kubernetes Engine API
    #"appengine.googleapis.com",        # App Engine Admin API
    #"cloudresourcemanager.googleapis.com", # Resource Manager API
    # Add or remove APIs as needed
  ]

backend_bucket_name = "mon8cats-tf-backend"

wi_sa_id = "cicd-service-account"
wi_pool_id = "github-pool"
wi_provider_id = "github-provider"

github_repository      = "Mon8Cats/devops-gke"
github_account         = "Mon8Cats"  # Optional if needed


