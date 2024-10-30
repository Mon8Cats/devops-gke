# modules/firewall/variables.tf

variable "vpc_id" {
  description = "The id of the VPC network to apply firewall rules to"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC network to use as a prefix in firewall rule names"
  type        = string
}


variable "firewall_rules" {
  description = "List of firewall rule configurations"
  type = list(object({
    name          = string
    protocol      = string
    ports         = list(string)
    source_ranges = optional(list(string), ["0.0.0.0/0"])   # Default to all sources
    priority      = optional(number, 1000)                 # Default priority
    description   = optional(string, "Custom firewall rule")
  }))
}
