resource "google_container_node_pool" "linux_pool" {
  name               = "linux-pool"
  project            = "bootcamp-363315"
  cluster            = google_container_cluster.my-gke-cluster.id
  location           = "us-central1-c"

autoscaling {
    min_node_count = "3"
    max_node_count = "3"
  }

  management {
    auto_repair  = "true"
    auto_upgrade = "true"
  }

  node_config {
    image_type   = "COS"
    machine_type = "e2-medium"

    labels = {
      private-pools-example = "true"
    }

    disk_size_gb = "30"
    disk_type    = "pd-standard"
    preemptible  = false

}