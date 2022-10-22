output "kubernetes_cluster_name" {
  value       = google_container_cluster.k8-cluster.name
  description = "Nome do cluster GKE"
  sensitive   = true
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.k8-cluster.endpoint
  description = "Host do cluster GKE"
  sensitive   = true
}