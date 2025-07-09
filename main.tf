resource "google_storage_bucket" "anu-bucket" {
  name          = "test-anu-bucket"
  location      = "US"
  project       = "bubbly-reducer-465214-m7"
  force_destroy = true



}