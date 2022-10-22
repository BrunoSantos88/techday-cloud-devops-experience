# Cluster GKE
resource "google_container_cluster" "devops-techday" {
  name     = "challenge-devops"
  location = "us-central1"

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  master_auth {
    username = "root"
    password = "root"

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

# Node Pool Gerenciado Separadamente
resource "google_container_node_pool" "nodes_primarios" {
  name       = "${google_container_cluster.devops-carrefuer.name}-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.devops-carrefuer.name
  node_count = 3

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = "bootcamp-363315"
    }

    machine_type = "e2-standard-2"
    tags         = ["gke-node", sensitive("${var.project_id}-gke")]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}