resource "kubernetes_namespace" "was" {
  metadata {
    name = "was"
  }
}

