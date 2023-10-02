resource "google_container_node_pool" "primary_preemptible_nodes-dev-test" {
  name       = "node-pool"
  location   = "southamerica-east1"
  cluster    = google_container_cluster.cluster-prod.id
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