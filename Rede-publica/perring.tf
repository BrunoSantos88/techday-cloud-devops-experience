resource "google_compute_network_peering" "peering1" {
  name         = "peering1"
  network      = google_compute_network.vpc1.id
  peer_network = "cluster-k8s-vpc"
}


resource "google_compute_network_peering" "peering2" {
  name         = "peering2"
  network      = "cluster-k8s-vpc"
  peer_network = google_compute_network.vpc1.id
}
