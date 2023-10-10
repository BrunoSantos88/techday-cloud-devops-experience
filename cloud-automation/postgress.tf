resource "google_sql_database_instance" "example_instance" {
  name             = "postgress-server"
  database_version = "POSTGRES_13"
  region           = "us-central1"

  settings {
    tier = "db-custom-2-7680"
  }

  deletion_protection = false

  depends_on = [google_project_service.postgres]
}

resource "google_project_service" "postgres" {
  project = "devops-399217"  # Your GCP project ID
  service = "sqladmin.googleapis.com"
}