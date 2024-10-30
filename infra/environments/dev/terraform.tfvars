# environments/dev/terraform.tfvars

project_id = "mon-infra-439715"
project_number = "324738742810"
region     = "us-central1"

subnet_configs = [
  {
    name = "dev-subnet-1"
    cidr = "10.0.1.0/24"
    region      = "us-central1"           # Add the region attribute here
    description = "Development subnet 1"  # Optional description
  },
  {
    name = "dev-subnet-2"
    cidr = "10.0.2.0/24"
    region      = "us-central1"           # Add the region attribute here
    description = "Development subnet 2"  # Optional description
  }
]

firewall_rules = [
  {
    name     = "allow-ssh"
    protocol = "tcp"
    ports    = ["22"]
  },
  {
    name     = "allow-http"
    protocol = "tcp"
    ports    = ["80"]
  }
]

github_repository      = "Mon8Cats/gke-devops-infra"
github_owner = "Mon8Cats"
#github_account         = "Mon8Cats"  # Optional if needed

# cicd service account roles
roles = [
  "roles/cloudbuild.builds.builder",
  "roles/artifactregistry.reader",
  "roles/storage.admin",
  "roles/run.admin",
  "roles/container.developer",
  "roles/iam.serviceAccountUser"
]
