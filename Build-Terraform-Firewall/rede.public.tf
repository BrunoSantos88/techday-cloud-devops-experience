resource "google_compute_firewall" "public" {
  project = "bootcamp-363315"
  name    = "public-netwrok"
  network = "public-vpc"
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80","8080","443","3306"]
  }

  source_tags   = ["public-acesso"]
  source_ranges = ["0.0.0.0/0"]

}