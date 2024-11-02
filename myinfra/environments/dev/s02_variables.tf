variable "gcp_project" {
    description = "value"
    type = string
    default = "abc123"
}

variable "gcp_region" {
    description = "value"
    type = string
    default = "us-central1"
}

variable "environment" {
    description = "value"
    type = string
    default = "dev"
}


variable "business_division" {
    description = "value"
    type = string
    default = "appdev"
}

variable "subnet_ip_range" {
    description = "value"
    type = string
    default = "10.128.0.0/20"
} 

variable "pods_ip_range" {
    description = "value"
    type = string
    default = "10.1.0.0/21"
}

variable "services_ip_range" {
    description = "value"
    type = string
    default = "10.2.0.0/21"
} 


variable "master_ip_range" {
    description = "value"
    type = string
    default = "10.3.0.0/28"
}