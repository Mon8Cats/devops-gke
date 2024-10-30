# modules/workload_identity/outputs.tf

output "workload_identity_pool_id" {
  description = "ID of the created workload identity pool"
  value       = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
}

output "workload_identity_provider_id" {
  description = "ID of the created workload identity provider"
  value       = google_iam_workload_identity_pool_provider.github_provider.workload_identity_pool_provider_id
}
