resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.postgres-cluster.id
  name       = "api_db"
}

resource "digitalocean_database_cluster" "postgres-cluster" {
  name       = "buzzword-stack-database-cluster"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "ams3"
  node_count = 1
}

resource "digitalocean_database_user" "db_user" {
  cluster_id = digitalocean_database_cluster.postgres-cluster.id
  name       = "safeuser"
}

output "dburi" {
  value = digitalocean_database_cluster.postgres-cluster.uri
}
output "dbpass" {
  value = digitalocean_database_user.db_user.password
}
