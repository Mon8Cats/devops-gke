# modules/firewall/outputs.tf

output "firewall_rule_names" {
  description = "List of names of created firewall rules"
  value       = [for rule in google_compute_firewall.custom_rules : rule.name]
}
