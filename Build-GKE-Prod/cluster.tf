resource "google_container_cluster" "cluster-k8" {
  name                     = "my-cluster-k8"
  location                 = ["us-central1-a","us-central1-b"]
  remove_default_node_pool = true
  initial_node_count       = 2
  network                  = "cluster-k8s-vpc"
  subnetwork               = "private"
  
  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "public-subnetwork"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}
