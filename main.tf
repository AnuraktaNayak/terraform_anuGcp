resource "google_storage_bucket" "anu-bucket" {
  name          = var.bucket_name
  location      = var.location
  project       = var.project
  force_destroy = true

}