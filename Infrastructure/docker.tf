resource "docker_registry_image" "frontend" {
  name = "${digitalocean_container_registry.container-registry.endpoint}/frontend"

  build {
    context = "../Application/Frontend"
  }
}

resource "docker_registry_image" "backend" {
  name = "${digitalocean_container_registry.container-registry.endpoint}/backend"

  build {
    context = "../Application/Backend"
  }
}

resource "docker_registry_image" "proxy" {
  name = "${digitalocean_container_registry.container-registry.endpoint}/proxy"

  build {
    context = "../Application/Proxy"
  }
}

