resource "google_storage_bucket" "anu-bucket" {
  name          = var.bucket_name
  location      = var.location
  project       = var.project
  force_destroy = true


  name: Terraform Format
    run: terraform fmt -check
    env:
      GOOGLE_CREDENTIALS: ${{ secrets.GCP_SA_KEY}}



}