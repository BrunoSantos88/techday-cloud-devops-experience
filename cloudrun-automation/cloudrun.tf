resource "google_cloud_run_service" "rancher" {
  name     = "my-cloud-run-service"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "rancher/server:stable"
        ports {
          container_port = 8080  # Porta que o contêiner escuta
        }
        resources {
          limits = {
            cpu    = "4"   # 0.5 núcleos de CPU
            memory = "2048"  # 512 MiB de memória
          }
        }
      }
    }

    
  }
}