resource "google_filestore_instance" "jekinsfile" {
  name     = "jenkins-file"
  location = "us-central1-b"
  tier     = "BASIC_HDD"

  file_shares {
    capacity_gb = 250
    name        = "share1"
  }

  networks {
    network = "default"
    modes   = ["MODE_IPV4"]
  }
}

output "filestore_instance_ip" {
  value = google_filestore_instance.jekinsfile.id
}