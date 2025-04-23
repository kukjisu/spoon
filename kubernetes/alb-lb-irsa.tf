module "alb_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.30.0"

  role_name = "alb-controller-role"

  attach_load_balancer_controller_policy = true

  oidc_providers = {
    main = {
      provider_arn     = data.terraform_remote_state.eks.outputs.oidc_provider_arn
      namespace_service_accounts = [
        "kube-system:aws-load-balancer-controller"
      ]
    }
  }
}

