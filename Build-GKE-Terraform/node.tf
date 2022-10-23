resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  cluster    = google_container_cluster.cluster-k8.id
  node_locations = [
    "us-central1-b", "us-central1-c", "us-central1-a"
  ]
  node_count = 3
  min_master_version = "1.22"


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
    max_node_count = 10
  }

   max_pods_per_node = 100

   management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    disk_size_gb = 10

}

}