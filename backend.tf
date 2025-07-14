terraform {
  backend "gcs" {
    bucket = "backend-gcs-bucket-statefiles" # Replace with your bucket name
    prefix = "terraform/state"
    project = "buckettest_anuraktnayaka8123"           # Optional prefix within the bucket
  }
}