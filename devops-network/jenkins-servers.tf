
resource "google_compute_instance" "jenkins_instance" {
  name         = "jenkins-server"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size =  250
    }
  }
 metadata = {
  ssh-keys = "myuser:${file("~/.ssh/id_rsa.pub")}"
}

   metadata_startup_script = file("./jenkins.sh")

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


resource "google_compute_firewall" "jenkins-firewall" {
  name          = "jenkins-firewall"
  network       = "default"  # Replace with your network name if not using the default network.
  allow {
    protocol = "tcp"
    ports    = ["8080", "50000"]  # Assuming Jenkins uses these ports.
  }
  source_ranges = ["0.0.0.0/0"]  # Restrict this to specific IP ranges for security.
  target_tags   = ["jenkins"]    # Assuming your Jenkins instance has the tag "jenkins".
}