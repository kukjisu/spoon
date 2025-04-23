resource "helm_release" "alb_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.9.2"
  namespace  = "kube-system"

  set {
    name  = "clusterName"
    value = data.terraform_remote_state.eks.outputs.cluster_name
  }

  set {
    name  = "region"
    value = "ap-northeast-2"
  }

  set {
    name  = "vpcId"
    value = data.terraform_remote_state.vpc.outputs.vpc
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }
  depends_on = [kubernetes_service_account.alb_sa]
}

