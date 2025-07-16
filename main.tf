resource "google_storage_bucket" "anu123-bucket" {
  name          = var.bucket_name
  location      = var.location
  project       = var.project
  force_destroy = var.force_destroy


  resource "google_sql_database_instance" "anu-cloudsql" {
  name             = var.pg_db_name
  database_version = var.pg_version
  region           = var.pg_region

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}


}