resource "google_container_cluster" "services-cluster" {
  name     = "services-cluster"
  location = "us-central1-b"
  initial_node_count = 1
  node_config {
    machine_type = "n1-standard-2"
  }
}


resource "local_file" "kube_config" {
  filename = "${path.module}/kube_config"
  content  = google_container_cluster.services-cluster.master_auth[0].kubeconfig
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
