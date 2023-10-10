resource "google_storage_bucket" "public_bucket" {
  name     = "publicbucketdevops"
  location = "US" # Change to your desired location

  # Enable uniform bucket-level access
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "public_bucket_binding" {
  bucket = google_storage_bucket.public_bucket.name
  role   = "roles/storage.objectViewer"

  members = [
     "user:devopsmanager@devops-399217.iam.gserviceaccount.com",
  ]
}