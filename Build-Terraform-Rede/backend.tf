resource "google_compute_subnetwork" "subnet-backend" {
  name          = "backend-vpc-subnetwork"
  ip_cidr_range = "10.3.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.backend-vpc.id

}

resource "google_compute_network" "backend-vpc" {
  name                    = "backend-infra-rede"
  auto_create_subnetworks = false
}