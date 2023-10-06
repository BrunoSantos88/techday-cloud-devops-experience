resource "google_compute_instance" "ansible_instance" {
  name         = "Ansible"
  machine_type = "e2-medium"
  zone         = "us-east-a"

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
