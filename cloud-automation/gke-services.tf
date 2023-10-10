resource "google_container_cluster" "services-cluster" {
  name     = "services-cluster"
  location = "us-central1-b"
  initial_node_count = 1
  node_config {
    machine_type = "n1-standard-2"
  }
}

output "services_cluster_name" {
  value = google_container_cluster.services-cluster.id
}


resource "google_compute_firewall" "gkeservice_firewall" {
  name    = "gkeservice-cluster-firewall"
  network = "default"  # You can change this to the desired network name

  allow {
    protocol = "tcp"
    ports    = ["30000-32800"]  # You can specify the desired ports
  }

  source_tags = ["services-cluster"]
}
