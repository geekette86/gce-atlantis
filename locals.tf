locals {
  labels = {
    "cost_center" = var.cost_center
    "environment" = var.environment
    "team"        = var.team
    "tech_lead"   = replace(lower(var.tech_lead), "/[_ .:/]/", "-")
  }

  env_variables = [
    {
      name  = "ATLANTIS_PORT"
      value = "4141"
    },
    {
      name  = "ATLANTIS_WRITE_GIT_CREDS"
      value = "true"
    },
    {
      name =  "ATLANTIS_DEFAULT_TF_VERSION"
      value = "v1.1.5"
    },
    {
      name  = "ATLANTIS_DATA_DIR "
      value = var.atlantis_data_dir
    },
    {
      name  = "ATLANTIS_GH_APP_ID"
      value = var.atlantis_gh_app_id
    },
    {
      name  = "ATLANTIS_REPO_ALLOWLIST"
      value = "github.com/*"
    },
    {
      name  = "ATLANTIS_GH_APP_KEY_FILE"
      value = "/key.pem"

    },
    {
      name = "ATLANTIS_GH_HOSTNAME"
      value = "github.com"
    },
    {
      name  = "ATLANTIS_REPO_CONFIG_JSON"
      value = jsonencode(yamldecode(file("${path.module}/atlantis.yaml")))
    }
  ]

  project_sa_name      = "${var.project_name}-sa"
  subnetwork_self_link = data.google_compute_subnetwork.subnetwork.self_link
}