resource "google_compute_instance" "node_instance" {
  name         = "nodejs"
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

resource "google_compute_firewall" "node-vm" {
  name    = "node"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }
   allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]  # Permite o tráfego de qualquer endereço IP (não recomendado para produção)
}
