# gce-atlantis
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | 2.3.4 |
| <a name="provider_google"></a> [google](#provider\_google) | 4.84.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_atlantis-vm"></a> [atlantis-vm](#module\_atlantis-vm) | github.com/terraform-google-modules/cloud-foundation-fabric//modules/compute-vm | v13.0.0 |
| <a name="module_gce-container"></a> [gce-container](#module\_gce-container) | terraform-google-modules/container-vm/google | 3.1.1 |
| <a name="module_project-factory"></a> [project-factory](#module\_project-factory) | terraform-google-modules/project-factory/google | 11.3.0 |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.atlantis_log_writer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.atlantis_metric_writer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [cloudinit_config.config](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_compute_subnetwork.subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | data source |
| [google_secret_manager_secret_version.gh_app_keyfile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/secret_manager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_tty"></a> [activate\_tty](#input\_activate\_tty) | n/a | `bool` | `false` | no |
| <a name="input_atlantis_data_dir"></a> [atlantis\_data\_dir](#input\_atlantis\_data\_dir) | n/a | `string` | `"/home/atlantis"` | no |
| <a name="input_atlantis_gh_app_id"></a> [atlantis\_gh\_app\_id](#input\_atlantis\_gh\_app\_id) | GitHub app id | `string` | `""` | no |
| <a name="input_atlantis_repo_allowlist"></a> [atlantis\_repo\_allowlist](#input\_atlantis\_repo\_allowlist) | List of GitHub repositories that Atlantis will be allowed to access | `list(string)` | <pre>[<br>  "github.com/myorg/*"<br>]</pre> | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | n/a | `string` | `""` | no |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | n/a | `string` | `""` | no |
| <a name="input_custom_command"></a> [custom\_command](#input\_custom\_command) | n/a | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `""` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | n/a | `string` | `""` | no |
| <a name="input_image"></a> [image](#input\_image) | # Container variables | `string` | `"custom-atlantis:1.1.1"` | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | n/a | `string` | `""` | no |
| <a name="input_privileged_mode"></a> [privileged\_mode](#input\_privileged\_mode) | n/a | `bool` | `false` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `""` | no |
| <a name="input_shared_vpc_network_name"></a> [shared\_vpc\_network\_name](#input\_shared\_vpc\_network\_name) | n/a | `string` | `""` | no |
| <a name="input_shared_vpc_project_name"></a> [shared\_vpc\_project\_name](#input\_shared\_vpc\_project\_name) | n/a | `string` | `""` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | n/a | `string` | `""` | no |
| <a name="input_team"></a> [team](#input\_team) | n/a | `string` | `""` | no |
| <a name="input_tech_lead"></a> [tech\_lead](#input\_tech\_lead) | n/a | `string` | `""` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->