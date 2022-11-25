resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  name             = "my-database-instance"
  region           = "us-central1"
  database_version = "MYSQL_5_7"
  settings{
    tier = "db-f1-micro"
    user_labels = {
      "environment" = "development"
    }
  }


ip_configuration {
      ipv4_enabled = false
      # private_network = var.vpc_name
      private_network = "cluster-k8s-vpc"
    }
  

  deletion_protection  = "false"
}

resource "google_sql_user" "users" {
name = "root"
instance = "${google_sql_database_instance.instance.name}"
host = "%"
password = "mypassw0rd"
}

output "connection_name" {
  value = google_sql_database_instance.instance.connection_name
}