variable "project" {
  type        = string
  description = "The GCP project ID where resources will be created"
}

variable "location" {
  type        = string
  description = "The location/region where the storage bucket will be created"
}

variable "bucket_name" {
  type        = string
  description = "The name of the Google Cloud Storage bucket to create"
}

variable "force_destroy" {
  type        = bool
  description = "Whether to force destroy the bucket when deleting (allows deletion of non-empty buckets)"
}

variable "pg_db_instance_name" {
  type        = string
  description = "pg_sql database instance for the springboot application"
}

variable "pg_version" {
  type        = string
  description = "pg_sql version"
}

variable "pg_region" {
  type        = string
  description = "pg_sql database region in which it is created"
}

variable "pg_db_name" {
  type        = string
  description = "pg_sql database name in which it is created"
}







