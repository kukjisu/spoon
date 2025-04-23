resource "kubernetes_deployment" "was" {
  metadata {
    name      = "was"
    namespace = "was"
    labels = {
      app = "was"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "was"
      }
    }

    template {
      metadata {
        labels = {
          app = "was"
        }
      }

      spec {
        container {
          name  = "was"
          image = "559394926122.dkr.ecr.ap-northeast-2.amazonaws.com/jisu:spingboot-docker"
          port {
            container_port = 8080
          }
        }

        affinity {
          node_affinity {
            required_during_scheduling_ignored_during_execution {
              node_selector_term {
                match_expressions {
                  key      = "private"
                  operator = "In"
                  values   = ["was"]
                }
              }
            }
          }
        }
      }
    }
  }
}

