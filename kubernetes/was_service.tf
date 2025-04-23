resource "kubernetes_service" "was-svc" {
  metadata {
    name      = "was-svc"
    namespace = "was"
  }

  spec {
    selector = {
      app = "was"
    }

    port {
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}

