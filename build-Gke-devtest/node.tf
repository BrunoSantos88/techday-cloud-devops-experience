resource "google_container_node_pool" "primary_k8_nodes-dev" {
  name       = "my-node-pool"
  location   = "southamerica-east1"
  cluster    = google_container_cluster.cluster-k8-dev.id
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

  }

management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }


}