# modules/network/main.tf

# Create VPC Network
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  description             = var.vpc_description
}

# Create Subnets
resource "google_compute_subnetwork" "subnet" {
  count         = length(var.subnet_configs)
  name          = var.subnet_configs[count.index].name
  ip_cidr_range = var.subnet_configs[count.index].cidr
  region        = var.subnet_configs[count.index].region
  network       = google_compute_network.vpc.id
  description   = var.subnet_configs[count.index].description
}
