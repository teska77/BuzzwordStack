resource "digitalocean_container_registry" "container-registry" {
  name                   = "buzzword-stack-container-registry"
  subscription_tier_slug = "starter"
}

resource "digitalocean_container_registry_docker_credentials" "docker-credentials" {
  write = true
  registry_name = digitalocean_container_registry.container-registry.name
}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = "buzzword-stack-kubernetes-cluster"
  region  = "ams3"
  version = "1.20.2-do.0"
  node_pool {
    name       = "buzzword-stack-cluster-pool"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    node_count = 1
    min_nodes  = 1
    max_nodes  = 5
  }
}

output "docker-credentials" {
  value = digitalocean_container_registry_docker_credentials.docker-credentials.docker_credentials
}

output "docker-container-registry" {
  value = digitalocean_container_registry.container-registry.endpoint
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.cluster.kube_config[0]["raw_config"]
}