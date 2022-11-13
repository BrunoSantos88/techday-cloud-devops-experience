resource "google_container_cluster" "cluster-k8-dev-test" {
  name                     = "cluster-k8-dev-test"
  location                 = "us-central1-f"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "cluster-k8s-vpc"
  subnetwork               = "k8-private"

  private_cluster_config {
    enable_private_nodes    = false
    enable_private_endpoint = false
    
  }
}

resource "google_container_cluster" "cluster-k8-dev-stating" {
  name                     = "cluster-k8-dev-stating"
  location                 = "us-central1-b"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "cluster-k8s-vpc"
  subnetwork               = "k8-private"

  private_cluster_config {
    enable_private_nodes    = false
    enable_private_endpoint = false
    
  }
}

resource "google_container_cluster" "cluster-k8-dev-prod" {
  name                     = "cluster-k8-dev-prod"
  location                 = "us-central1-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "cluster-k8s-vpc"
  subnetwork               = "k8-private"

  private_cluster_config {
    enable_private_nodes    = false
    enable_private_endpoint = false
    
  }
}