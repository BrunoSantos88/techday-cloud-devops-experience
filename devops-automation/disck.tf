resource "google_compute_disk" "my_disk" {
  name  = "jekins-disk"
  size  = 500  # Size of the disk in GB
  type  = "pd-standard"  # Type of disk (pd-standard or pd-ssd)
  zone  = "us-central1-a"  # Specify the desired zone
}