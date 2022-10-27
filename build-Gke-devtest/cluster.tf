resource "google_container_cluster" "cluster-dev-test" {
  name     = "my-gke-cluster-devtest"
  location = "southamerica-east1"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "vpc-america-sul-public"
  subnetwork               = "public-subnetwork"


   private_cluster_config {
    enable_private_nodes    = false
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}

