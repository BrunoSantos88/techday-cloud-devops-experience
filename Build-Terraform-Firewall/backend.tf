resource "google_compute_firewall" "backend" {
  project = "bootcamp-363315"
  name    = "backend-firewall"
  network = "backend-infra-rede"
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80","8080","443"]
  }

  source_tags   = ["frontend"]
  source_ranges = ["0.0.0.0/0"]

}