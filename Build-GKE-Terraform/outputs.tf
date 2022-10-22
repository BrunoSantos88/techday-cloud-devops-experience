output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "Nome do cluster GKE"
  sensitive   = true
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "Host do cluster GKE"
  sensitive   = true
}