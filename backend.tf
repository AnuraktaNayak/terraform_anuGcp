terraform {
  backend "gcs" {
    bucket = "backend-gcs-bucket-statefiles" # Replace with your bucket name
    prefix = "terraform/state"               # Optional prefix within the bucket
  }
}