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

resource "random_integer" "priority" {
  min = 1
  max = 50000
  }
output "my_integer" {
  value = random_integer.my_integer.result
}

resource "google_storage_bucket" "default" {
  name = "omar_tf_gcp_bucket_${my_integer}"
  project = "${var.project}"
  storage_class = "REGIONAL"
  location = "us-east1"
}