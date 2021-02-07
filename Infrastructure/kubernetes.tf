provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "do-ams3-buzzword-stack-kubernetes-cluster"
}

data "kubernetes_namespace" "default" {
  metadata {
    name = "default"
  }
  depends_on = [ kubernetes_secret.dockerconfig ]
}

resource "kubernetes_secret" "dockerconfig" {
  metadata {
    name = "regcred"
  }

  data = {
    ".dockerconfigjson" = digitalocean_container_registry_docker_credentials.docker-credentials.docker_credentials
  }

  type = "kubernetes.io/dockerconfigjson"
}

output "kubesecret" {
  value = kubernetes_secret.dockerconfig.data
}
