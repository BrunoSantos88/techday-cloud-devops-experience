resource "google_container_cluster" "cluster-k8-dev" {
  name                     = "my-cluster-k8-dev"
  location                 = "southamerica-east1"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "vpc-america-sul-public"
  subnetwork               = "public-subnetwork"


  ip_allocation_policy {
    cluster_primeri_range_name  = "public-subnetwork"
    
  }
  
  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}