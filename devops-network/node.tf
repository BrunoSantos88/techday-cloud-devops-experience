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

   metadata = {
  ssh-keys = "username:${file("myssh.pub")}"
}



  metadata_startup_script = file("./node.sh")

  scheduling {
    preemptible       = true
    automatic_restart = false
  }


  network_interface {
    network = "default"
    
       # Associe um endereço IP público padrão à instância
    access_config {}
  }

  }

resource "google_compute_firewall" "nd-firewall" {
  name          = "nd-firewall"
  network       = "default"  # Replace with your network name if not using the default network.
  allow {
    protocol = "tcp"
    ports    = ["22","50000"]  # Assuming Jenkins uses these ports.
  }
  source_ranges = ["0.0.0.0/0"]  # Restrict this to specific IP ranges for security.
  target_tags   = ["agent-node"]    # Assuming your Jenkins instance has the tag "jenkins".
}