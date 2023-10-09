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

  network_interface {
    network = "default"
    
       # Associe um endereço IP público padrão à instância
    access_config {}
  }

     metadata = {
    startup-script = file("node.sh")
  }
}