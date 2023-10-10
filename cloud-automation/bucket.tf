resource "google_storage_bucket" "private_bucket" {
  name          = "devopsmentoriaprivate"                    
  location      = "US"                                          
  storage_class = "STANDARD"                                     
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
  bucket = google_storage_bucket.public_bucket.name
  role   = "roles/storage.objectViewer"
  members = [
    "user:187.10.145.102",
  ]
}