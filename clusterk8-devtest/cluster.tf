resource "google_container_cluster" "cluster-k8-dev-test" {
  name                     = "mycluster-dev"
  location                 = "southamerica-east1"
  node_locations           = ["southamerica-east1-a"]
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "public-vpc"
  subnetwork               = "public"

  private_cluster_config {
    enable_private_nodes    = false
    enable_private_endpoint = false
    
  }
}