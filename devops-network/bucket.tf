resource "google_storage_bucket" "example_bucket" {
  name          = "devopsmentoriabucket"                    # A globally unique bucket name
  location      = "US"                                           # The desired location for the bucket
  storage_class = "STANDARD"                                     # The storage class for the bucket
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.example_bucket.name}"
}