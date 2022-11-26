output "endpoint" {
  description = "ip cluste devteste"
  sensitive   = true
  value       = var.kubernetes_cluster_name.teste
}

output "kubernetes_cluster_host" {
  value       = var.kubernetes_cluster_name.teste
  description = "Nome de Cluster Dev"
  sensitive   = false
}

output "endpoint" {
  description = "Ip cluster Produçao"
  sensitive   = true
  value       =var.kubernetes_cluster_name.pro
}

output "kubernetes_cluster_host" {
  value       = ""
  description = "Nome do cluster Produçao"
  sensitive   = false
}

output "vpc_priavate_name" {
  value       = ""
  description = "Nome do cluster Produçao"
  sensitive   = false
}

output "vpc_public_name" {
  value       = ""
  description = "Nome do cluster Produçao"
  sensitive   = false
}

output "bancodados_name" {
  value       = ""
  description = "Nome do cluster Produçao"
  sensitive   = false
}




