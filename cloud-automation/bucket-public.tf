resource "google_storage_bucket" "public_bucket" {
  name     = "publicbucketmentoria"
  location = "US"
}

resource "google_storage_bucket_iam_binding" "example_binding" {
  bucket = google_storage_bucket.public_bucket.id
  role   = "roles/storage.objectViewer"

  members = ["allUsers"]
}

resource "google_storage_bucket_iam_condition" "example_condition" {
  bucket = google_storage_bucket.public_bucket.id

  title       = "ip-allowlist-and-time-window"
  description = "Allow access from specific IP address within a time window"
  expression  = "request.origin.ip == '187.10.145.102' && timestamp.now >= '2023-10-09T08:00:00Z' && timestamp.now <= '2023-10-09T16:00:00Z'"
}

resource "google_storage_bucket_object_lifecycle_rule" "example_rule" {
  bucket = google_storage_bucket.public_bucket.id

  action {
    type = "Delete"
  }

  condition {
    age_days = 1
  }
}




