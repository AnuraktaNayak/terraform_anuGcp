resource "google_storage_bucket" "my_bucket"{
	name = var.name
	location= var.location
	force_destroy = var.force_destroy
}