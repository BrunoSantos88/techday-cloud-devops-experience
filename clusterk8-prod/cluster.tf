resource "google_container_cluster" "cluster-prod" {
  name                     = "mycluster-prod"
  location                 = "southamerica-east1"
  node_locations           = ["southamerica-east1-a","southamerica-east1-b","southamerica-east1-c"]
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "vpc-private"
  subnetwork               = "k8-private"

  
  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }
}