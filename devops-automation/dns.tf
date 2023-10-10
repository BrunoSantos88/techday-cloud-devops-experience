resource "google_dns_record_set" "a" {
  name         = "backend.${google_dns_managed_zone.prod.dns_name}"
  managed_zone = google_dns_managed_zone.prod.name
  type         = "A"
  ttl          = 300

  rrdatas = [""]
}

resource "google_dns_managed_zone" "prod" {
  name     = ""
  dns_name = ""
}