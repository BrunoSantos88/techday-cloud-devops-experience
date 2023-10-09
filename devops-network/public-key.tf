resource "google_compute_project_metadata_item" "ssh_key" {
  key   = "ssh-keys"
  value = "your-ssh-user:${file("~/.ssh/id_rsa.pub")}"
}