resource "google_storage_bucket_object" "kube_config" {
  name   = "kube_services"
  bucket = google_storage_bucket.private_bucket.name
  source = local_file.kube_config.filename
}

resource "google_storage_bucket_object" "kube_config" {
  name   = "kube_aplication"
  bucket = google_storage_bucket.private_bucket.name
  source = local_file.kube_config.filename
}