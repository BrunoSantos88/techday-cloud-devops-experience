resource "google_storage_bucket_object" "kube_config-kube_services" {
  name   = "kube_conf"
  bucket = google_storage_bucket.private_bucket.name
  source = local_file.kube_config.filename
}

resource "google_storage_bucket_object" "kube_config-kube_aplication" {
  name   = "kube_conf"
  bucket = google_storage_bucket.private_bucket.name
  source = local_file.kube_config.filename
}