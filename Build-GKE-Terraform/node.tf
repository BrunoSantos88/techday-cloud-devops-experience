resource "google_container_node_pool" "quickstart-dv_nodes" {
  name       = "my-node-dev"
  location   = "us-central1"
  cluster    = google_container_cluster.cluster-quickstart-dv.id
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


resource "google_container_node_pool" "quickstart-prod_nodes" {
  name       = "my-node-prod"
  location   = "us-central1"
  cluster    = google_container_cluster.quickstart-prod.id
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