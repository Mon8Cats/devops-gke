# modules/network/outputs.tf

output "vpc_id" {
  description = "The ID of the created VPC network"
  value       = google_compute_network.vpc.id
}

output "vpc_name" {
  description = "The name of the created VPC network"
  value       = google_compute_network.vpc.name
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = [for subnet in google_compute_subnetwork.subnet : subnet.id]
}
