output "kubernetes_cluster_name" {
  value       = google_container_cluster.quickstart-prod.name
  description = "Nome do cluster GKE"
  sensitive   = false
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.quickstart-prod.endpoint
  description = "Host do cluster GKE"
  sensitive   = false
}
