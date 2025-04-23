
resource "aws_eks_addon" "vpc_cni" {
  cluster_name = module.eks_cluster.cluster_name
  addon_name   = "vpc-cni"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = module.eks_cluster.cluster_name
  addon_name   = "kube-proxy"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "eks_pod_identity_agent" {
  cluster_name = module.eks_cluster.cluster_name
  addon_name   = "eks-pod-identity-agent"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
}

resource "aws_eks_addon" "coredns" {
  cluster_name = module.eks_cluster.cluster_name
  addon_name   = "coredns"
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"
  depends_on = [module.eks_nodegroup]
}

