# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "router" {
  name    = "router"
  region  = "us-central1"
  network = google_compute_network.cluster-k8s-vpc.id
}