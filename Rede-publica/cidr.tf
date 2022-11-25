resource "google_compute_subnetwork" "subnet1" {
  name          = "lab1"
  ip_cidr_range = "10.0.0.0/16"
  region        = "southamerica-east1"
  network       = google_compute_network.vpc1.id
}