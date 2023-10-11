resource "google_compute_instance" "node_instance" {
  name         = "node1-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-b"


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

  tags = ["node1-instance"]

    metadata_startup_script = data.template_file.startup_script.rendered
}