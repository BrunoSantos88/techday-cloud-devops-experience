resource "google_storage_bucket" "example_bucket" {
  name     = "publicbucketdevops"
  location = "US" # Change to your desired location

  # Enable uniform bucket-level access
  uniform_bucket_level_access = true
}
