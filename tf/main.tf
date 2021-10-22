provider "google" {
version = "3.5.0"
region = "us-central1"
zone = "us-central1-c"
project = "${var.project}"
}

resource "google_compute_network" "vpc_network" {
 project = "${var.project}"
name = "terraform-network"
}
resource "google_compute_instance" "vm_instance" {
project = "${var.project}"
name = "terraform-instance2"
machine_type = "f1-micro"
zone = "us-central1-c"
boot_disk {
initialize_params {
image = "centos-cloud/centos-7"
}
}

network_interface {
network = google_compute_network.vpc_network.name
access_config {
}
}
}