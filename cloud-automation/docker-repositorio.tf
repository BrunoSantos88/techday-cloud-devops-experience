resource "google_container_registry_repository" "frontend" {
  name = "frontend"
  region = "us-central1" 
}

resource "google_container_registry_repository" "backend" {
  name = "backend"
  region = "us-central1" 
}