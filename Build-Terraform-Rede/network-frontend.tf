resource "google_compute_subnetwork" "subnet-frontend" {
  name          = "frontend-vpc-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.frontend-vpc.id

}

resource "google_compute_network" "frontend-vpc" {
  name                    = "frontend-infra-rede"
  auto_create_subnetworks = false
}