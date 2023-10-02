
resource "google_compute_instance" "my_instance" {
  name         = "jenkins"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
attached_disk {
    source = google_compute_disk.my_disk.name
    type   = "pd-standard"  # Pode ser pd-standard ou pd-ssd dependendo do tipo de disco desejado
  }

# Crie um disco de 100 GB
resource "google_compute_disk" "my_disk" {
  name  = "my-disk"
  size  = "250"
  type  = "pd-standard"  # Pode ser pd-standard ou pd-ssd dependendo do tipo de disco desejado
  zone  = "us-central1-a" # A mesma zona da instância
}

  network_interface {
    network = "default"
    
       # Associe um endereço IP público padrão à instância
    access_config {}
  }
  metadata_startup_script = "echo 'BASE64_SCRIPT' | base64 -d > /tmp/myscript.sh && chmod +x /tmp/myscript.sh && /tmp/myscript.sh"
}


resource "google_compute_firewall" "allow_8080" {
  name    = "allow-8080"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}