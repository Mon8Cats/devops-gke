provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_billing_budget" "budget_alert" {
  billing_account = "your-billing-account-id" # Replace with your billing account ID
  display_name    = var.budget_name

  budget_filter {
    projects = ["projects/${var.project_id}"]  # Apply to all projects in this example
    services = ["services/*"]  # Apply to all services
  }

  amount {
    specified_amount {
      currency_code = "USD"
      units         = var.amount
    }
  }

  threshold_rules {
    threshold_percent = 0.5  # 50% alert
  }

  threshold_rules {
    threshold_percent = 1.0  # 100% alert
  }

  all_updates_rule {
    pubsub_topic         = "projects/myproject/topics/mytopic"  # Optional: set up a Pub/Sub topic for notifications
    schema_version       = "1.0"
    monitoring_notification_channels = []  # Add monitoring notification channels here if needed
  }
}

# gcloud beta billing accounts list -> get my billing account
