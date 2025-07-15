output "bucket_name" {
  description = "The name of the created storage bucket"
  value       = google_storage_bucket.anu123-bucket.name
}

output "bucket_url" {
  description = "The URL of the created storage bucket"
  value       = google_storage_bucket.anu123-bucket.url
}

output "bucket_location" {
  description = "The location of the created storage bucket"
  value       = google_storage_bucket.anu123-bucket.location
}