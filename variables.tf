variable "project_name" {
  type    = string
  default = ""
}

variable "organization_id" {
  type    = string
  default = ""
}

variable "billing_account" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "zone" {
  type    = string
  default = ""
}

variable "tech_lead" {
  type    = string
  default = ""
}

variable "cost_center" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = ""
}

variable "team" {
  type    = string
  default = ""
}

variable "folder_id" {
  type    = string
  default = ""
}


variable "shared_vpc_project_name" {
  type    = string
  default = ""
}

variable "shared_vpc_network_name" {
  type    = string
  default = ""
}

variable "subnet" {
  type    = string
  default = ""
}


## Container variables
variable "image" {
  default = "artifact_url/custom-atlantis:1.1.1"
  type    = string
}

variable "custom_command" {
  type    = string
  default = ""
}
variable "activate_tty" {
  type    = bool
  default = false
}
variable "privileged_mode" {
  type    = bool
  default = false
}
#--------------------------------------------------------------
# Atlantis
#--------------------------------------------------------------

variable "atlantis_repo_allowlist" {
  description = "List of GitHub repositories that Atlantis will be allowed to access"
  type        = list(string)
  default     = ["github.com/myorg/*"]
}
variable "atlantis_gh_app_id" {
  description = "GitHub app id"
  type        = string
  default     = ""
}

variable "atlantis_data_dir" {
  description = ""
  type        = string
  default     = "/home/atlantis"
}

