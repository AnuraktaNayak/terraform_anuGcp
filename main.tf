resource "google_storage_bucket" "anu-bucket" {
  # name          = var.bucket_name
  # location      = var.location
  # project       = var.project
  # force_destroy = true

  name          = "bucket_anu"
  location      = "US"
  project       = "bubbly-reducer-465214-m7"
  force_destroy = true

}