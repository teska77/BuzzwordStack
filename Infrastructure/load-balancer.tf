# resource "digitalocean_loadbalancer" "public" {
#   name   = "loadbalancer-1"
#   region = "ams3"
#   size="lb-small"

#   forwarding_rule {
#     entry_port     = 80
#     entry_protocol = "http"

#     target_port     = 80
#     target_protocol = "http"
#   }
#   forwarding_rule {
#     entry_port     = 443
#     entry_protocol = "https"

#     target_port     = 443
#     target_protocol = "https"
#   }

#   healthcheck {
#     port     = 22
#     protocol = "tcp"
#   }

# }