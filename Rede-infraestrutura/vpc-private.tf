resource "google_compute_network" "private" {
  name                    = "vpc-private"
  auto_create_subnetworks = false
}