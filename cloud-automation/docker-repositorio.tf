data "google_artifact_registry_repository" "frontend" {
  location      = "us-central1"
  repository_id = "frontend"
}