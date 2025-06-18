resource "google_artifact_registry_repository" "anu_docker_repo"{
	project       = var.project_id
  	location      = var.location
  	repository_id = var.repository_id
  	description   = var.repository_description
  	format        = var.format
}