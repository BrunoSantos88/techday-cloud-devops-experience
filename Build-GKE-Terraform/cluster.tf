#Cluster GKE
resource "google_container_cluster" "k8_cluster" {
remove_default_node_pool = true
initial_node_count       = 1
network    = "cluster-k8s-vpc"
subnetwork = "private"

  
client_certificate_config {
issue_client_certificate = false
    }
  }

resource "google_container_node_pool" "nodes_primarios" {
  name       = "${google_container_cluster.k8_cluster.name}-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.k8_cluster.name
  node_count = "1"

  
    machine_type = "e2-standard-2"
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }