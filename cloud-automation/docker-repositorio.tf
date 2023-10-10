resource "google_artifact_registry_repository" "frontend" {
  location      = "us-central1"
  repository_id = "frontend"
  description   = "example docker repository"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository" "backend" {
  location      = "us-central1"
  repository_id = "backend"
  description   = "example docker repository"
  format        = "DOCKER"
}