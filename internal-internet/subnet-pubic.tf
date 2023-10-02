resource "google_compute_subnetwork" "subnet1" {
  name          = "public"
  ip_cidr_range = "172.10.0.0/16"
  region        = "southamerica-east1"
  network       = google_compute_network.vpc1.id
}