resource "google_compute_instance" "node2_instance" {
  name         = "node2-instance"
  machine_type = "e2-medium"
  zone         = "southamerica-east1-b"


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

  tags = ["node2-instance"]

    metadata_startup_script = data.template_file.startup_script.rendered
}