resource "kubernetes_ingress_v1" "was_ingress" {
  metadata {
    name      = "was-ingress"
    namespace = "was"
    annotations = {
      "kubernetes.io/ingress.class"                        = "alb"
      "alb.ingress.kubernetes.io/scheme"                   = "internet-facing"
      "alb.ingress.kubernetes.io/target-type"              = "ip"
      "alb.ingress.kubernetes.io/listen-ports"             = "[{\"HTTP\": 8080}]"
      "alb.ingress.kubernetes.io/subnets"                  = join(",", data.terraform_remote_state.vpc.outputs.public_subnet_ids)
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.was-svc.metadata[0].name
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }

  depends_on = [
    kubernetes_service.was-svc
  ]
}

