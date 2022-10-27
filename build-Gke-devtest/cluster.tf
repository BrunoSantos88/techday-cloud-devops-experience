resource "google_container_cluster" "cluster-dev-test" {
  name     = "my-gke-cluster-devtest"
  location = "southamerica-east1"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = "vpc-america-sul-public"
  subnetwork               = "public-subnetwork"
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-devtest"
  location   = "southamerica-east1"
  cluster    = google_container_cluster.cluster-dev-test.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

  }
}
