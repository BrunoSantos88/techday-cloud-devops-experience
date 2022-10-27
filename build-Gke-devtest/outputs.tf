output "kubernetes_cluster_name" {
  value       = google_container_cluster.cluster-k8-dev.name
  description = "Nome do cluster GKE"
  sensitive   = false
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.cluster-k8-dev.endpoint
  description = "Host do cluster GKE"
  sensitive   = false
}
