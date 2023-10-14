data "template_file" "startup_script" {
  template = file("cluster.sh")
}

resource "google_compute_instance" "cluster_instance" {
  name         = "cluster-instance"
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


  tags = ["cluster-instance"]

    metadata_startup_script = data.template_file.startup_script.rendered
}