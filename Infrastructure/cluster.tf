resource "digitalocean_container_registry" "container-registry" {
  name                   = "buzzword-stack-container-registry"
  subscription_tier_slug = "basic"
}

data "digitalocean_container_registry" "container-registry" {
  name = digitalocean_container_registry.container-registry.name
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

provider "docker" {
  host = "unix:///var/run/docker.sock"

  registry_auth {
    address             = data.digitalocean_container_registry.container-registry.server_url
    config_file_content = digitalocean_container_registry_docker_credentials.docker-credentials.docker_credentials
  }
}

output "docker-credentials" {
  value = digitalocean_container_registry_docker_credentials.docker-credentials.docker_credentials
}

output "docker-credentials-exp" {
  value = digitalocean_container_registry_docker_credentials.docker-credentials.credential_expiration_time
}


output "docker-container-registry" {
  value = digitalocean_container_registry.container-registry.endpoint
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.cluster.kube_config[0]["raw_config"]
}

output "ip" {
  value = digitalocean_kubernetes_cluster.cluster.ipv4_address
}
