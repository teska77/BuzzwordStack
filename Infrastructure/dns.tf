resource "digitalocean_domain" "domain" {
  name       = "buzzwordstack.tech"
  ip_address = data.kubernetes_ingress.ingress.status[0]["load_balancer"][0]["ingress"][0]["ip"]
}

data "kubernetes_ingress" "ingress" {
  metadata {
    name = "minimal-ingress"
  }
}