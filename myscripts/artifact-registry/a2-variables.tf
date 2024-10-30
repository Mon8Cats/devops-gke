variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "repository_name" {
  type    = string
  default = "myapps-repository"
}

variable "repository_format" {
  type    = string
  default = "DOCKER"
}

variable "repository_mode" {
  type    = string
  default = "REMOTE"
}
