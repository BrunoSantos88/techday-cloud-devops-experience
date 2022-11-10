resource "google_compute_subnetwork" "k8-server-southamerica" {
  name          = "public-subnetwork"
  ip_cidr_range = "192.10.10.0/24"
  region        = "southamerica-east1"
  network       = google_compute_network.rede-america-sul.id
  
}
