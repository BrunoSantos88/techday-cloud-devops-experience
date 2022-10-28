output "kubernetes_cluster_name-1" {
  value       = google_container_cluster.cluster-k8-dev-test.name
  description = "Nome do cluster GKE"
  sensitive   = false
}

output "kubernetes_cluster_host-1" {
  value       = google_container_cluster.cluster-k8-dev-test.endpoint
  description = "Host do cluster GKE"
  sensitive   = false
}