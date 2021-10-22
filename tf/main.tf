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

resource "google_storage_bucket" "omar_tf_gcp_buckest_test_28011999" {
  name = "omar_tf_gcp_bucket_280199_test"
  project = "${var.project}"
  storage_class = "REGIONAL"
  location = "us-east1"
}