resource "google_compute_network_peering" "peering1" {
  name         = "peering1"
  network      = google_compute_network.vpc1.id
  peer_network = google_compute_network.cluster-k8s-vpc.id
}


resource "google_compute_network_peering" "peering2" {
  name         = "peering2"
  network      = google_compute_network.cluster-k8s-vpc.id
  peer_network = google_compute_network.vpc1.id
}
