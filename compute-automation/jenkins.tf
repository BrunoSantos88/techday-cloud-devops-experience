data "template_file" "startup_script" {
  template = file("jenkins.sh")
}

resource "google_compute_instance" "jenkins_instance" {
  name         = "jenkins-instance"
  machine_type = "e2-standard-2"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size          = 500
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["jenkins-instance"]

    metadata_startup_script = data.template_file.startup_script.rendered
}

resource "google_compute_firewall" "allow-instance" {
  name          = "allow2-instance"
  network       = "default"  # Change to your network if needed
  priority      = 1000       # Adjust the priority as needed

  source_ranges = ["0.0.0.0/0"]  # Be cautious with this; restrict the source IP range if possible

  # Define the allowed ports
  allow {
    protocol = "tcp"
    ports    = ["8080", "22"]  # Example ports (customize as needed)
  }

  # Specify the target tags to associate this rule with instances
  target_tags   = ["jenkins-instance"]  # Replace with your instance's tag
}