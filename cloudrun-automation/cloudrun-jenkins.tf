resource "google_cloud_run_service" "jenkins" {
  name     = "jenkinserver"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "brunosantos88/jenkinserver:31"
        ports {
          container_port = 8080  # Porta que o contêiner escuta
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