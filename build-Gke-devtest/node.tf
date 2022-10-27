resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-devtest"
  location   = "southamerica-east1"
  cluster    = google_container_cluster.cluster-dev-test.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }


}

  }