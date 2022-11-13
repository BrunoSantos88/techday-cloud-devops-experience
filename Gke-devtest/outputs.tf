output "kubernetes_cluster_dev-teste" {
  value       = google_container_cluster.cluster-k8-dev-test.name
  description = "Nome do cluster GKE"
  sensitive   = false
}

output "kubernetes_cluster_host-dev" {
  value       = google_container_cluster.cluster-k8-dev-stating.endpoint
  description = "Host do cluster GKE"
  sensitive   = false
}

output "kubernetes_cluster_dev-staing" {
  value       = google_container_cluster.cluster-k8-dev-stating.name
  description = "Nome do cluster GKE"
  sensitive   = false
}

output "kubernetes_cluster_host-staging" {
  value       = google_container_cluster.cluster-k8-dev-test.endpoint
  description = "Host do cluster GKE"
  sensitive   = false
}

output "kubernetes_cluster_dev-pro" {
  value       = google_container_cluster.cluster-k8-dev-prod.name
  description = "Nome do cluster GKE"
  sensitive   = false
}

output "kubernetes_cluster_host-prod" {
  value       = google_container_cluster.cluster-k8-dev-prod.endpoint
  description = "Host do cluster GKE"
  sensitive   = false
}