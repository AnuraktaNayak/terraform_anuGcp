provider "google" {
	credentials =file("./ferrous-octane-455420-n9-4bfcfb812b37.json")
	project = "ferrous-octane-455420-n9"
	region = "us-central1"
}

# resource "google_project" "my_project-in-a-folder"{
# 	name = "My-QA-Project "
# 	project_id = "My-QA-Project"
# 	folder_id = goole_folder.department1.name
# }

# creating a bucket
module "google_storage_bucket" {
	source = "./cloudbucket"
	force_destroy = var.force_destroy
	name = var.name
	location = var.location
}

# resource "google_storage_bucket" "my_bucket"{
# 	name = "my-bucket-name-anurakta"
# 	location="us-central1"
# 	force_destroy = true
# }

# resource "google_storage_bucket" "my_bucket1"{
# 	name = "my-bucket-input-anurakta"
# 	location="us-central1"
# 	force_destroy = true
# }



# resource "google_storage_bucket_iam_member" "bucket_writer"{
# 	bucket= google_storage_bucket.my_bucket.name
# 	role= "roles/storage.objectCreator"
# 	member="serviceAccount:terraform-service-account@ferrous-octane-455420-n9.iam.gserviceaccount.com"

# }
# # resource "google_artifact_registry_repository" "anu_docker_repo"{
# 	project       = "ferrous-octane-455420-n9"
#   	location      = "us-central1"
#   	repository_id = var.repository_id
#   	description   = "anu docker repository"
#   	format        = "DOCKER"
# }



module "artifact-reg-repo"{
	source = "./artifactregistry"
	project_id = var.project_id
  	location = var.location
  	repository_id = var.repository_id
  	repository_description = var.repository_description
  	format = var.format
}

# binding artifact registry role to the SA account 
# resource "google_project_iam_member" "artifact_registry_admin_role"{
# 	project= "ferrous-octane-455420-n9"
# 	role= "roles/artifactregistry.admin"
# 	member="serviceAccount:terraform-service-account@ferrous-octane-455420-n9.iam.gserviceaccount.com"

# }
# resource "google_bigquery_dataset" "dataset" {
# 	dataset_id = "anu_dataset_dataset_id"
# 	friendly_name ="My BigQuery Dataset"
# 	description = "This is a test data set for anu"
# 	location = "us-central1"
# }

# resource "google_service_account" "notebook_sa_anu"{
# 	account_id = "vertex-workbench-sa-anu"
# 	display_name = "Vertex AI workbench Service Account"
# 	description = "Service account creation for Vertex AI notebook "
# 	disabled = false

# }

# resource "google_notebooks_instance" "anu-workbench"{
# 	name = "my-vertex-workbench-instance-anu"
# 	location = "us-central1-a"
# 	machine_type="e2-medium"
# 	vm_image {
# 		image_family = "tf-latest-cpu"
# 		project      = "deeplearning-platform-release"
	  
# 	}
# }

resource "google_pubsub_topic" "topic"{
	name = "anu-pubsub-topic"
}

data "google_storage_project_service_account" "gcs_account"{
	project = "ferrous-octane-455420-n9"
}

resource "google_pubsub_topic_iam_binding" "publisher"{
	topic = google_pubsub_topic.topic.id
	role = "roles/pubsub.publisher"
	members = ["serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"]
}


# resource "google_storage_notification" "notification"{
# 	bucket  = google_storage_bucket.my_bucket.name
# 	topic   = google_pubsub_topic.topic.id
# 	payload_format = "JSON_API_V1"
# 	depends_on = [ google_pubsub_topic_iam_binding.publisher ]
# }