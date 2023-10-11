resource "google_artifact_registry_repository" "my-frontend" {
  location      = "us-central1"
  repository_id = "my-frontend"
  description   = "example docker repository"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}

resource "google_artifact_registry_repository" "my-backend" {
  location      = "us-central1"
  repository_id = "my-backend"
  description   = "example docker repository"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}