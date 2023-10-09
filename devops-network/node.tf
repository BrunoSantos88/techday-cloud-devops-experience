resource "google_compute_instance" "node_instance" {
  name         = "node-agent"
  machine_type = "e2-medium"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size =  80
    }
  }

    metadata_startup_script = base64encode(file("node.sh"))

  network_interface {
    network = "default"
    
       # Associe um endereço IP público padrão à instância
    access_config {}
  }

  }

resource "google_compute_firewall" "node-firewall" {
  name          = "node-firewall"
  network       = "default"  # Replace with your network name if not using the default network.
  allow {
    protocol = "tcp"
    ports    = ["22","8080", "50000"]  # Assuming Jenkins uses these ports.
  }
  source_ranges = ["0.0.0.0/0"]  # Restrict this to specific IP ranges for security.
  target_tags   = ["agent-node"]    # Assuming your Jenkins instance has the tag "jenkins".
}