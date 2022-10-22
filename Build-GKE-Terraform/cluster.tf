resource "google_container_cluster" "cluster-k8" {
  name     = "my-cluster-k8"
  location                 = "us-central1-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "cluster-k8s-vpc"
  subnetwork               = "private"

   node_locations = [
    "us-central1-b"
  ]

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "10.0.0.0/18"
  }


}
