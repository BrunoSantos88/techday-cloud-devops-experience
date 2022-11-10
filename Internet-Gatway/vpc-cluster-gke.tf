resource "google_compute_network" "rede-america-sul" {
  name                    = "vpc-america-sul-public"
  auto_create_subnetworks = false
}