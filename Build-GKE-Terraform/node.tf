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
    machine_type = "e2-standard-4"

  }
}

resource "google_container_node_pool" "node-cluster" {
  name    = "node-cluster"
  cluster = google_container_node_pool.k8s-cluster.id

  autoscaling {
    max_node_count = 1
    min_node_count = 1
  }
  max_pods_per_node = 100

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    disk_size_gb = 20

  }

}