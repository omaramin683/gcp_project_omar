terraform {
  required_providers {
    google = {}
  }

  backend "gcs" {
    bucket = "UPDATE_ME_BUCKET_OMAR"      #change this  # GCS bucket name to store terraform tfstate
    prefix = "Omar"           # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  }
}
provider "google" {
    version = "3.5.0"
    region = "us-central1"
    zone = "us-central1-c"
    project = "${var.project}"
}

resource "google_storage_bucket" "tf_bucket" {
  name          = "omar_tf_bucket"
  location  = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}