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
  project  = var.project
}
# resource "google_sql_user" "anu_user" {
#   name     = "test123"
#   instance = google_sql_database_instance.anu-cloudsql.name
#   password = "test123"
#   project  = var.project
# }


resource "google_secret_manager_secret" "db_password_secret" {
  secret_id = "anu_db_password_secret-1"
  project   = var.project

  labels = {
    secretmanager = "db_password"

  }

  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
    }
  }
}

resource "google_secret_manager_secret_version" "my_secret_version" {
  secret      = google_secret_manager_secret.db_password_secret.secret_id
  secret_data = "anu-super-secret-value" # For demonstration; use sensitive input in production
}




resource "google_artifact_registry_repository" "anu-repo" {
  location      = "us-central1"
  repository_id = "anu-artifact-repository"
  description   = "dockerimage repository"
  format        = "DOCKER"
  project       = var.project
}

