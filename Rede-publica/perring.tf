resource "google_compute_network_peering" "peering1" {
  name         = "peering1"
  network      = google_compute_network.vpc1.id
  peer_network = var.resource_rede_clusterk8
}


resource "google_compute_network_peering" "peering2" {
  name         = "peering2"
  network      = var.resource_rede_clusterk8
  peer_network = google_compute_network.vpc1.id
}
