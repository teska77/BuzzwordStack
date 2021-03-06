resource "digitalocean_domain" "domain" {
  name       = "buzzwordstack.tech"
  ip_address = data.kubernetes_ingress.ingress.status[0]["load_balancer"][0]["ingress"][0]["ip"]
  depends_on = [data.kubernetes_ingress.ingress]
}

data "kubernetes_ingress" "ingress" {
  metadata {
    name = "minimal-ingress"
  }
    depends_on = [data.kubernetes_namespace.default]
}
