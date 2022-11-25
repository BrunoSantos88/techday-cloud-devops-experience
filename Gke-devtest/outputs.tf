output "kubernetes_cluster_dev-teste" {
  value       = google_container_cluster.cluster-k8-dev-test2.name
  description = "Nome do cluster GKE"
  sensitive   = false
}