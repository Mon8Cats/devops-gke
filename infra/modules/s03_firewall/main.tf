# modules/firewall/main.tf

resource "google_compute_firewall" "custom_rules" {
  for_each    = { for rule in var.firewall_rules : rule.name => rule }
  name        = "${var.vpc_name}-${each.value.name}"
  network     = var.vpc_id
  direction   = "INGRESS"
  priority    = each.value.priority != null ? each.value.priority : 1000  # Default priority 1000
  description = each.value.description != null ? each.value.description : "Custom firewall rule"

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }

  source_ranges = each.value.source_ranges != null ? each.value.source_ranges : ["0.0.0.0/0"]
}
