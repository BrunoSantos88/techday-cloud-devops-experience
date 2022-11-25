resource "google_compute_network" "vpc1" {
  name = "public-vpc"
  auto_create_subnetworks = false
}  
 