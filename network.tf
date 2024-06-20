data "google_compute_network" "vpc_network" {
  name    = var.shared_vpc_network_name
  project = var.shared_vpc_project_name
}


data "google_compute_subnetwork" "subnetwork" {
  name    = var.subnet
  project = var.shared_vpc_project_name
  region  = var.region
}
