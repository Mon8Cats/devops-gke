variable "project_id" {
  type    = string
  default = "my project123" # Replace with your GCP project ID
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "budget_name" {
  type    = string
  default = "budget-alert-monthly"
}

variable "amount" {
  type    = number
  default = 100
}

variable "time_period" {
  type    = string
  default = "MONTHLY"
}
