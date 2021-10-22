resource "google_storage_bucket" "default" {
  name = "${var.bucket_name}"
  project = "${var.project}"
  storage_class = "${var.storage_class}"
  location = "${var.bucket_location}"
}