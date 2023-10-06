resource "google_compute_instance" "ansible_instance" {
  name         = "Ansible"
  machine_type = "e2-medium"
  zone         = "us-east1-b"

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

   metadata_startup_script = <<EOF
#!/bin/bash
 sudo apt-get update
 sudo apt-get install python -y
 sudo apt install ansible -y
EOF
}

output "instance_ip" {
  value = google_compute_instance.ansible_instance.network_interface[0].access_config[0].nat_ip
}


resource "google_compute_firewall" "ansible-vm" {
  name    = "ansible-8080"
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
