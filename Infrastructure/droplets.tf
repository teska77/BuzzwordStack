resource "digitalocean_droplet" "main" {
  image = "docker-20-04"
  name = "main"
  region = "ams3"
  size = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.key.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file("~/.ssh/digital_ocean_buzzword")
    timeout = "2m"
  }

  provisioner "file" {
    source      = "../Application/.env"
    destination = "/tmp/.env"
  }

  provisioner "file" {
    source      = "../Application/docker-compose-prod.yml"
    destination = "/tmp/docker-compose.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "cd /tmp",
      "cat docker-compose.yml",
      "docker-compose build",
      "docker-compose up -d",
    ]
  }
}

resource "digitalocean_firewall" "web" {
  name = "firewall-simple"

  droplet_ids = [digitalocean_droplet.main.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

resource "digitalocean_floating_ip" "public_ip" {
  region = "ams3"
}

resource "digitalocean_floating_ip_assignment" "link_ip" {
  ip_address = digitalocean_floating_ip.public_ip.ip_address
  droplet_id = digitalocean_droplet.main.id
}
