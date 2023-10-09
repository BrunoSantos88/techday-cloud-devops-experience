
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

  metadata_startup_script = base64encode(file("jenkins.sh"))

  network_interface {
    network = "default"
    
       # Associe um endereço IP público padrão à instância
    access_config {}
  }

}


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

  metadata_startup_script = base64encode(file("node.sh"))


  network_interface {
    network = "default"
    
       # Associe um endereço IP público padrão à instância
    access_config {}
  }
}