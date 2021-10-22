variable "bucket_name" {
  type = string
  description = "Bucket name"
}
variable "bucket_location" {
  type = string
  default = "us-east1"
}

variable "storage_class" {
  type = string
}

resource "google_storage_bucket" "default" {
  name = "omar_tf_gcp_bucket_280199"
  project = "${var.project}"
  storage_class = "REGIONAL"
  location = "us-east1"
}