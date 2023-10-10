resource "google_storage_bucket" "private_bucket" {
  name          = "devopsmentoriaprivate"                    
  location      = "US"                                          
  storage_class = "STANDARD"                                     
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.private_bucket.id}"
}

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
    "user:187.10.145.102",
  ]
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.public_bucket.id}"
}