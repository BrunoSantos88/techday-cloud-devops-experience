
resource "google_compute_instance" "my_instance" {
  name         = "jenkins"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size =  100
    }
  }
  network_interface {
    network = "default"
    
       # Associe um endereço IP público padrão à instância
    access_config {}
  }
 metadata_startup_script = "echo 'BASE64_SCRIPT' | base64 -d > /tmp/myscript.sh && chmod +x /tmp/myscript.sh && /tmp/myscript.sh"
}



resource "google_compute_firewall" "jenkins-vm" {
  name    = "jenkins-8080"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]  # Permite o tráfego de qualquer endereço IP (não recomendado para produção)
}
