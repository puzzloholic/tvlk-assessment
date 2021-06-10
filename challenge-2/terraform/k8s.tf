resource "kubernetes_namespace" "tvlk_dev" {
  metadata {
    name = "tvlk-dev"
  }
}

resource "kubernetes_namespace" "utility" {
  metadata {
    name = "utility"
  }
}

resource "kubernetes_namespace" "elastic_system" {
  metadata {
    name = "elastic-system"
  }
}

data "kubectl_filename_list" "eck" {
  pattern = "./yaml/eck/*.yaml"
}

resource "kubectl_manifest" "eck" {
  count     = length(data.kubectl_filename_list.eck.matches)
  yaml_body = file(element(data.kubectl_filename_list.eck.matches, count.index))

  depends_on = [
    helm_release.eck_operator,
    kubernetes_secret.tvlk_es_filerealm,
  ]
}


resource "kubernetes_secret" "tvlk_es_filerealm" {
  metadata {
    name = "tvlk-es-filerealm-secret"
    namespace  = kubernetes_namespace.elastic_system.metadata[0].name
  }

  data = {
    "users" = <<EOF
tvlk:$2a$10$/tdibc6.SwYRUBU4v6ypauL9MCSKvfph7tcIcOmQyff1PAqB9p93G
EOF
    "users_roles" = <<EOF
superuser:elastic,elastic-internal,tvlk
EOF
  }
}
