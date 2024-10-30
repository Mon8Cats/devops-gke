# modules/cicd_service_account/variables.tf

variable "project_id" {
  description = "Project ID where the service account will be created"
  type        = string
}

variable "project_number" {
  description = "The Google Cloud project number"
  type        = string
}

variable "service_account_id" {
  description = "Unique name for the service account"
  type        = string
}

variable "service_account_display_name" {
  description = "Display name for the service account"
  type        = string
  default     = "CI/CD Service Account"
}

variable "roles" {
  description = "List of roles to assign to the service account"
  type        = list(string)
}

variable "workload_identity_pool_id" {
  description = "ID of the workload identity pool to use"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository to link with Workload Identity Pool"
  type        = string
}
