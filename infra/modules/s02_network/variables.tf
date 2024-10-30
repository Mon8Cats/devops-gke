# modules/network/variables.tf

variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "vpc_description" {
  description = "The description of the VPC network"
  type        = string
  default     = "Custom VPC network"
}

variable "subnet_configs" {
  description = "A list of configurations for each subnet"
  type = list(object({
    name        = string
    cidr        = string
    region      = string
    description = optional(string, "Custom subnet")
  }))
}
