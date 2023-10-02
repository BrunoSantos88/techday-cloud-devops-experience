resource "google_compute_firewall" "public-firewall" {
  project = "devops-399217"
  name    = "public-rede"
  network = "public-vpc"
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80","8080","443","30000-32900","3306"]
  }

  source_tags   = ["cluster-k8-dev"]
  source_ranges = ["0.0.0.0/0"]

}