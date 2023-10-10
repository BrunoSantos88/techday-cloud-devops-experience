resource "google_container_cluster" "example-cluster" {
  name     = "services-cluster"
  location = "us-central1-a"
  initial_node_count = 2
  node_config {
    machine_type = "n1-standard-2"
  }
}

output "cluster_name" {
  value = google_container_cluster.example-cluster.name
}


resource "google_compute_firewall" "gke_firewall" {
  name    = "gke-cluster-firewall"
  network = "default"  # You can change this to the desired network name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "30000-32800"]  # You can specify the desired ports
  }

  source_tags = ["gke-your-cluster-name"]
}
