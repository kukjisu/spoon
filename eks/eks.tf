module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name = "jisu-spoon-cluster"
  cluster_version = "1.32"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access = false

  bootstrap_self_managed_addons = false

  cluster_addons = {}

  eks_managed_node_groups = {}

  enable_cluster_creator_admin_permissions = true
  create_iam_role = true

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  control_plane_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids

}

