data "template_file" "startup_script" {
  template = file("jenkins.sh")
}

resource "google_compute_instance" "jenkins_instance" {
  name         = "jenkins-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size          = 500
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }


  tags = ["jenkins-instance"]

    metadata_startup_script = data.template_file.startup_script.rendered
}