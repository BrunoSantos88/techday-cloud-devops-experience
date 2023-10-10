resource "google_filestore_instance" "servicesfile" {
  name     = "services-file"
  location = "us-central1-b"
  tier     = "BASIC_HDD"

  file_shares {
    capacity_gb = 250
    name        = "share"
  }

  networks {
    network = "default"
    modes   = ["MODE_IPV4"]
  }
}

output "filestore_instance_ip" {
  value = google_filestore_instance.servicesfile.id
}