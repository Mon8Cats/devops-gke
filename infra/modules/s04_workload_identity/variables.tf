# modules/workload_identity/variables.tf

variable "pool_id" {
  description = "ID for the workload identity pool"
  type        = string
}

variable "pool_display_name" {
  description = "Display name for the workload identity pool"
  type        = string
  default     = "GitHub Workload Identity Pool"
}

variable "pool_description" {
  description = "Description of the workload identity pool"
  type        = string
  default     = "Workload identity pool for GitHub Actions integration"
}

variable "provider_id" {
  description = "ID for the workload identity pool provider"
  type        = string
  default     = "github-provider"
}

variable "provider_display_name" {
  description = "Display name for the GitHub provider"
  type        = string
  default     = "GitHub Identity Provider"
}

# modules/workload_identity/variables.tf

variable "github_repository" {
  description = "The GitHub repository to link with Workload Identity Pool (e.g., 'your-org/your-repo')"
  type        = string
}
