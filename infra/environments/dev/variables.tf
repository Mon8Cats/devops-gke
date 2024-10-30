variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "project_number" {
  description = "The Google Cloud project number"
  type        = string
}

variable "region" {
  description = "The region for the resources"
  type        = string
}

variable "subnet_configs" {
  description = "List of subnet configurations"
  type = list(object({
    name        = string
    cidr        = string
    region      = string
    description = optional(string, "Custom subnet")
  }))
}


variable "firewall_rules" {
  description = "Configurations for firewall rules"
  type = list(object({
    name     = string
    protocol = string
    ports    = list(string)
  }))
}


variable "github_repository" {
  description = "The github reporitory"
  type        = string
}

variable "github_owner" {
  description = "The github owner"
  type        = string
}

variable "roles" {
  description = "List of roles to assign to the service account"
  type        = list(string)
}