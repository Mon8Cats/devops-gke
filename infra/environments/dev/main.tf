# environments/dev/main.tf

provider "google" {
  project = var.project_id
  region  = var.region
}

# (0) manually do github repo connection in cloud build trigger


# (1) enable apis
module "api_enablement" {
  source    = "../../modules/s01_api_enablement"
  project_id = var.project_id
  # Optionally override the list of APIs
  api_list   = [
    "cloudbuild.googleapis.com",       # Cloud Build API
    "artifactregistry.googleapis.com", # Artifact Registry API
    "iam.googleapis.com",              # IAM API
    "compute.googleapis.com",          # Compute Engine API
    "run.googleapis.com",              # Cloud Run API
    "cloudfunctions.googleapis.com",   # Cloud Functions API
    "container.googleapis.com",        # Kubernetes Engine API
    "appengine.googleapis.com",        # App Engine Admin API
    "cloudresourcemanager.googleapis.com", # Resource Manager API
    # Add or remove APIs as needed
  ]
}

# (2) vpc
module "network" {
  source         = "../../modules/s02_network"
  vpc_name       = "dev-vpc"
  #region         = var.region
  subnet_configs = var.subnet_configs
  #firewall_rules = var.firewall_rules
}

# (3) firewall rules
module "firewall_rules" {
  source       = "../../modules/s03_firewall"
  vpc_id     = module.network.vpc_id
  vpc_name  = module.network.vpc_name
  firewall_rules = var.firewall_rules
}

# (4) workload identity
module "workload_identity" {
  source                 = "../../modules/s04_workload_identity"
  pool_id                = "github-pool"
  provider_id            = "github-provider"
  pool_display_name      = "GitHub Workload Identity Pool"
  provider_display_name  = "GitHub Identity Provider"

  # Pass your GitHub repository and account
  github_repository      = var.github_repository
  #github_account         = "Mon8Cats"  # Optional if needed
}


# (5) cicd service account
module "cicd_service_account" {
  source                     = "../../modules/s05_cicd_service_account"
  project_id                 = var.project_id
  project_number            = var.project_number 
  service_account_id         = "cicd-service-account"
  roles                      = var.roles
  workload_identity_pool_id  = module.workload_identity.workload_identity_pool_id
  github_repository          = var.github_repository
}


# (6) cloud build trigger 
module "cloud_build_trigger" {
  source            = "../../modules/s06_cloud_build_trigger"
  trigger_name      = "dev-build-trigger"
  description       = "Trigger to build on GitHub pushes or merges for dev environment"
  build_config_file = "cloudbuild.yaml"
  github_owner      = var.github_owner
  github_repo       = var.github_repository
  branch_regex      = "^main$"  # Customize to trigger on specific branches
  service_account_email = module.cicd_service_account.service_account_email
  #connection_id = 1
}
