resource "google_compute_instance" "jenkins_instance" {
  name         = "jenkins-instancia"
  machine_type = "e2-standard-2"
   zone         = "us-central1-a"
  
  boot_disk {
    source = "vm-jenkins"
  }

  network_interface {
    network = "default"
  }

  tags = ["jenkins-instance"]
}