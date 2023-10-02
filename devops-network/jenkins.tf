
resource "google_compute_instance" "my_instance" {
  name         = "jenkins"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
  }


  # Crie e execute o script codificado em base64 no início da inicialização
   metadata_startup_script = "touch abcd.txt" 
}
