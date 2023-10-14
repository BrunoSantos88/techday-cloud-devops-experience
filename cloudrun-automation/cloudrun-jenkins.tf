resource "google_cloud_run_service" "default" {
  name     = "cloudrun-srv"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "brunosantos88/jenkinserver:31"
        startup_probe {
          initial_delay_seconds = 0
          timeout_seconds = 1
          period_seconds = 3
          failure_threshold = 1
          tcp_socket {
            port = 8080
          }
        }
        resources {
          limits = {
            cpu    = "4.0"   # 0.5 núcleos de CPU
             memory = "8Gi"
          }
        }
        liveness_probe {
          http_get {
            path = "/"
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  lifecycle {
    ignore_changes = [
      metadata.0.annotations,
    ]
  }
}
