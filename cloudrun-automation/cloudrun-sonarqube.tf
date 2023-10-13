resource "google_cloud_run_service" "Sonarquebe" {
  name     = "sonarqube"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "brunosantos88/awssonarqube:latest"
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