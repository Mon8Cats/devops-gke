# modules/cloud_build_trigger/variables.tf

variable "trigger_name" {
  description = "Name of the Cloud Build trigger"
  type        = string
}

variable "description" {
  description = "Description of the Cloud Build trigger"
  type        = string
  default     = "Trigger to build on GitHub pushes or merges"
}

variable "build_config_file" {
  description = "Path to the Cloud Build configuration file (cloudbuild.yaml)"
  type        = string
}

variable "github_owner" {
  description = "GitHub owner or organization name"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
}

variable "branch_regex" {
  description = "Regex pattern for branches to trigger the build (e.g., '^main$', '.*' for all branches)"
  type        = string
}

variable "service_account_email" {
  description = "GitHub repository name"
  type        = string
}

/*
variable "connection_id" {
  description = "GitHub repository name"
  type        = string
}
*/