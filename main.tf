resource "google_storage_bucket" "anu123-bucket" {
  name          = var.bucket_name
  location      = var.location
  project       = var.project
  force_destroy = var.force_destroy


}