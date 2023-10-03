terraform {
}

provider "google" {
  project     = var.gcp_project_id
  region  = "us-central1"
  zone    = "us-central1-c"
}