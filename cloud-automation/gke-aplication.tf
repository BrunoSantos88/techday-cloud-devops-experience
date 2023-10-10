resource "google_container_cluster" "aplication-cluster" {
  name     = "aplication-cluster"
  location = "us-central1-a"
  initial_node_count = 1
  node_config {
    machine_type = "n1-standard-2"
  }
}

resource "local_file" "kube_config" {
  filename = "${path.module}/kube_config"
  content  = google_container_cluster.aplication-cluster.master_auth[0].kubeconfig
}

resource "google_storage_bucket_object" "kube_config" {
  name   = "kube_aplication"
  bucket = google_storage_bucket.private_bucket.name
  source = local_file.kube_config.filename
}
resource "google_compute_firewall" "gkeaplication_firewall" {
  name    = "gkeaplication-cluster-firewall"
  network = "default"  # You can change this to the desired network name

  allow {
    protocol = "tcp"
    ports    = ["30000-32800"]  # You can specify the desired ports
  }

  source_tags = ["aplication-cluster"]
}