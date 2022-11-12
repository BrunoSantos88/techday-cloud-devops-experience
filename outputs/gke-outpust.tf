output "Cluster Dev-Test" {
  # This may seem redundant with the `name` input, but it serves an important
  # purpose. Terraform won't establish a dependency graph without this to interpolate on.
  description = "The name of the cluster master. This output is used for interpolation with node pools, other modules."

  value = var.resourse_group_name_cluster_dev_test
}

output "endpoint" {
  description = "The IP address of the cluster master."
  sensitive   = true
  value       = var.resourse_group_name_cluster_dev_test
}

output "kubernetes_cluster_host" {
  value       = var.resourse_group_name_cluster_dev_test
  description = "Host do cluster GKE"
  sensitive   = false
}

output "Cluster Prod" {
  # This may seem redundant with the `name` input, but it serves an important
  # purpose. Terraform won't establish a dependency graph without this to interpolate on.
  description = "The name of the cluster master. This output is used for interpolation with node pools, other modules."

  value = var.resourse_group_name_cluster_dev_test
}

output "endpoint" {
  description = "The IP address of the cluster master."
  sensitive   = true
  value       = var.resourse_group_name_cluster_prod
}

output "kubernetes_cluster_host" {
  value       = var.resourse_group_name_cluster_prod
  description = "Host do cluster GKE"
  sensitive   = false
}
