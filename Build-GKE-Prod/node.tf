resource "google_container_node_pool" "primary_preemptible_nodes-dev-test" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.cluster-k8.id
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

  }

management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 3
    max_node_count = 3
  }


}