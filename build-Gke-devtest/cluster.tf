resource "google_container_cluster" "cluster-k8-dev" {
  name                     = "my-cluster-k8-devtest"
  location                 = "us-central1-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "cluster-k8s-vpc"
  subnetwork               = "private"
  

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
  }
}

