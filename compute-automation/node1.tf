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

  metadata = {
  ssh-keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCeYD5nZfqLSKaWdRVgZiKK91f/3YzjiimUkAlchRgKo7Y6QUP9ZIdwGhXYTLFBBEHzyX3hFu3TOUzAhWQLQLO+QUfZSrln0pia36GioS2dQx+y9fhXWP7oHnIRJpHjUuj+dF5PWfKebu7UadQ3qdrc1EkiKMedqnzB9nevVPgN4KGbNIsoKnXeLen5URWEIwH1hgsb180uoTZKFmPSBAEsY1UuWm/uY82F2laJWgbRx2AiV9BCgc+YDj4GnCmf131cpE6fVVxMtlODJE6sF0Xr9wP9xJXnEtwFOGUgJ3LT4kwkvivOok1NsQ558P3LCagSvwAvHyr67Dt77qGTZRUPVPAhZRe9dJVwSCMrgksjsArxDG7O79u2L2CIryBDGafdZcqpm41ZjLorEjkn53SX0Yy5sriPROiACYCv7020ZwQzf4RpU+el0N+xXFMv3aX1j6/BJJ/Mz7ZtxjeuLrGFLkT+AB6LGT+8EyR0ZeRdyEcNqwfBcKoXayf1ZlRfz6E= NoteCasa@DESKTOP-OUCBTTA"
}

  tags = ["node1-instance"]

    metadata_startup_script = data.template_file.startup_script.rendered
}