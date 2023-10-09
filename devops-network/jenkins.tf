
resource "google_compute_instance" "jenkins_instance" {
  name         = "jenkins"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size =  250
    }
  }

  metadata_startup_script = base64encode(file("jenkins.sh"))

  network_interface {
    network = "default"
    
       # Associe um endereço IP público padrão à instância
    access_config {}
  }

}