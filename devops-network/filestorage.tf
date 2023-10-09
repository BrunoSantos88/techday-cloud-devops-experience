resource "google_filestore_instance" "instance" {
  name     = "test-instance"
  location = "us-central1-b"
  tier     = "BASIC_HDD"

  file_shares {
    capacity_gb = 1024
    name        = "share1"
  }

  networks {
    network = "default"
    modes   = ["MODE_IPV4"]
  }
}

output "filestore_instance_ip" {
  value = google_filestore_instance.instance.id
}