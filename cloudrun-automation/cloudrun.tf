resource "google_cloud_run_service" "rancher" {
  name     = "my-cloud-run-service"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "sonarqube"
        ports {
          container_port = 9000  # Porta que o contêiner escuta
        }
        resources {
          limits = {
            cpu    = "4.0"   # 0.5 núcleos de CPU
             memory = "8Gi" 
          }
        }
      }
    }

    
  }
}