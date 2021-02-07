provider "digitalocean" {
  token = var.do_token
}
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.5.1"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = "2.11.0"
    }
  }
}
