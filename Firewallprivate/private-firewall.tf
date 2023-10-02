resource "google_compute_firewall" "k8s-cluster" {
  project = "bootcamp-363315"
  name    = "cluster-k8-firewall-devtest"
  network = "vpc-private"
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80","8080","443","30000-32900","30005"]
  }

  source_tags   = ["cluster-k8s"]
  source_ranges = ["0.0.0.0/0"]

}