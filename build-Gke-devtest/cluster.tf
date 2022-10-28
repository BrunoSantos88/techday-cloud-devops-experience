resource "google_container_cluster" "cluster-k8-dev-test" {
  name                     = "my-cluster-k8-dev-test"
  location                 = "us-central1-f"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "cluster-k8s-vpc"
  subnetwork               = "private"

   # Enabling autopilot for this cluster
  enable_autopilot = true
  
  private_cluster_config {
    enable_private_nodes    = false
    enable_private_endpoint = false
  }
}

 resource "google_container_cluster" "cluster-k8-staging-test" {
  name                     = "my-cluster-k8-staging"
  location                 = "us-central1-f"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "cluster-k8s-vpc"
  subnetwork               = "private"

   # Enabling autopilot for this cluster
  enable_autopilot = true
  
  private_cluster_config {
    enable_private_nodes    = false
    enable_private_endpoint = false
  }
}