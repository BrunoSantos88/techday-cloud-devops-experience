resource "google_compute_instance" "jenkins_instance" {
  name         = "jenkins-instance"
  machine_type = "n1-standard-1" # You can choose an appropriate machine type

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = file("jenkins.sh")
}

resource "google_compute_firewall" "jenkins" {
  name    = "allow-8080"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]  # Be cautious with this; restrict the source IP range if possible
}