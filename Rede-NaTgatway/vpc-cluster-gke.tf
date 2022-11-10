resource "google_compute_network" "cluster-k8s-vpc" {
  name                    = "cluster-k8s-vpc"
  auto_create_subnetworks = false
}