resource "google_artifact_registry_repository" "sonarquebe" {
  location      = "us-central1"
  repository_id = "sonarquebe"
  description   = "sonarquebe repository"
  format        = "DOCKER"

  docker_config {
    immutable_tags = true
  }
}