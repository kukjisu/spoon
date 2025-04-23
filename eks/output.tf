output "cluster_name" {
  value = module.eks_cluster.cluster_name
}

output "oidc_provider_arn" {
  value       = module.eks_cluster.oidc_provider_arn
}
