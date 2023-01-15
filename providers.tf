terraform {
  required_version = "1.3.7"
}

provider "google" {
  project = "qwiklabs-gcp-04-15179ed14b7b"
  region  = "us-central1"
  zone    = "us-central1-c"
}