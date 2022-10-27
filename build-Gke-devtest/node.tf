resource "google_container_node_pool" "primary_preemptible_nodes-devtest" {
  name       = "my-node-devtest"
  location   = "us-central1"
  cluster    = google_container_cluster.cluster-k8-devtest.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

}

  }