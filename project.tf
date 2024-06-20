module "project-factory" {
  source            = "terraform-google-modules/project-factory/google"
  version           = "11.3.0"
  random_project_id = false

  name            = var.project_name
  org_id          = var.organization_id
  billing_account = var.billing_account
  folder_id       = var.folder_id
  labels          = local.labels
  bucket_location      = var.region
  bucket_project       = var.project_name
  project_sa_name = local.project_sa_name
  activate_apis = [
    "iam.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "storage.googleapis.com"
  ]
  svpc_host_project_id = var.shared_vpc_project_name
  shared_vpc_subnets   = [local.subnetwork_self_link]
}
