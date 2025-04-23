module "eks_nodegroup" {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "~> 20.0"

  cluster_name = module.eks_cluster.cluster_name
  cluster_service_cidr = module.eks_cluster.cluster_service_cidr

  name = "Test"
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids

  instance_types = ["t3.medium"]
  desired_size   = 2
  min_size       = 2
  max_size       = 2

  ami_type = "AL2023_x86_64_STANDARD"

  labels = {
    private = "was"
  }

  depends_on = [
    aws_eks_addon.vpc_cni,
    aws_eks_addon.kube_proxy,
    aws_eks_addon.eks_pod_identity_agent
  ]

  tags = {
    Environment = "Spoon-Test"
    Terraform   = "true"
  }

}

