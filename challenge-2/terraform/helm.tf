resource "helm_release" "sample_app" {
  name       = "sample-app"
  chart      = "../sample-app/helm-chart"
  namespace  = kubernetes_namespace.tvlk_dev.metadata[0].name
  version    = "0.1.1"

  set {
    name  = "image.repository"
    value = var.sample_app_image_repo
  }

  depends_on = [
    kubernetes_namespace.tvlk_dev,
  ]
}

resource "helm_release" "fluentd" {
  name       = "fluentd"
  repository = "https://fluent.github.io/helm-charts"
  chart      = "fluentd"
  namespace  = kubernetes_namespace.utility.metadata[0].name
  version    = "0.2.6"

  values = [
    file("yaml/helm-values/fluentd.yaml")
  ]

  depends_on = [
    kubernetes_namespace.utility,
  ]
}

resource "helm_release" "eck_operator" {
  name       = "eck-operator"
  repository = "https://helm.elastic.co"
  chart      = "eck-operator"
  namespace  = kubernetes_namespace.elastic_system.metadata[0].name
  version    = "1.6.0"

  depends_on = [
    kubernetes_namespace.elastic_system,
  ]
}