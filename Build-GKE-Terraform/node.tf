resource "google_container_node_pool" "k8s-cluster" {
  name       = "k8s-cluster"
  cluster    = "k8-cluster-devops"
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = "e2-small"

  }
}

resource "google_container_node_pool" "node-cluster" {
  name    = "node-cluster"
  cluster = google_container_node_pool.k8s-cluster.id

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 3
    max_node_count = 10
  }

  node_config {
    preemptible  = true
    machine_type = "e2-small"
    
  }
}