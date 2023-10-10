resource "google_storage_bucket" "public_bucket" {
  name          = "devopsmentoriapublic"
  location      = "US" 
  storage_class = "STANDARD" 

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_binding" "ip_acl" {
  bucket = google_storage_bucket.public_bucket.id
  role   = "roles/storage.objectViewer"
  members = [
    "user:<IP_ADDRESS_OR_RANGE>",
  ]
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.public_bucket.name}"
}