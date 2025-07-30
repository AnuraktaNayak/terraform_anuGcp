resource "google_storage_bucket" "anu123-bucket" {
  name          = var.bucket_name
  location      = var.location
  project       = var.project
  force_destroy = var.force_destroy

}

resource "google_sql_database_instance" "anu-cloudsql" {
  name             = var.pg_db_instance_name
  database_version = var.pg_version
  region           = var.pg_region
  project          = var.project

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "anu_database" {
  name     = var.pg_db_name
  instance = google_sql_database_instance.anu-cloudsql.name
}

# resource "random_password" "pwd" {
#   length  = 16
#   special = false
# }

# resource "google_sql_user" "user" {
#   name     = "user123"
#   instance = google_sql_database_instance.anu-cloudsql.name
#   password = random_password.pwd.result
#   project  = var.project
# }