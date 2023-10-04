resource "google_compute_instance" "my_instance1" {
  name         = "keycloak"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size =  250
    }
  }
  network_interface {
    network = "default"
    
       # Associe um endereço IP público padrão à instância
    access_config {}
  }
}



resource "google_compute_firewall" "jenkins-vm" {
  name    = "keycloak"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
   allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]  # Permite o tráfego de qualquer endereço IP (não recomendado para produção)
}
