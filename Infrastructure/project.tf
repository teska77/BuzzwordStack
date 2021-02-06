resource "digitalocean_project" "buzzword_stack" {
  name        = "buzzword_stack_project"
  description = "A project with a lot of technologies."
  purpose     = "Web Application"
  environment = "Production"
}

resource "digitalocean_ssh_key" "key" {
  name       = "tf-key"
  public_key = file("~/.ssh/digital_ocean_buzzword.pub")
}

resource "digitalocean_project_resources" "resources" {
  project = digitalocean_project.buzzword_stack.id
  resources = [
    digitalocean_database_cluster.postgres-cluster.urn,
    "do:kubernetes:${digitalocean_kubernetes_cluster.cluster.id}",
  ]
}