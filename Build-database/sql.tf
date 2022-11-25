resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.master.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "master" {
  name             = "mysql94251"
  database_version = "MYSQL_5_7"
  region           = "us-central1"
 settings {
    tier = "db-n1-standard-1"
    
    ip_configuration {
      ipv4_enabled    = true
      authorized_networks{
        value = "0.0.0.0/0"
    }
  }
}
  

  deletion_protection  = "false"
}

resource "google_sql_user" "users" {
name = "root"
instance = "${google_sql_database_instance.master.name}"
host = "%"
password = "mypassw0rd"
}

output "Db-IP" {
  value = google_sql_database_instance.master.first_ip_address
  depends_on=[google_sql_database_instance.master]
}