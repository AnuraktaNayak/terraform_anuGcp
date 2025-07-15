# terraform_anuGcp

This Terraform project creates a Google Cloud Storage bucket.

## Usage

1. Configure your variables in `terraform.tfvars`
2. Run `terraform init`
3. Run `terraform plan`
4. Run `terraform apply`

## Requirements

- Terraform >= 0.12
- Google Cloud provider

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.anu123-bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the Google Cloud Storage bucket to create | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Whether to force destroy the bucket when deleting (allows deletion of non-empty buckets) | `bool` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the storage bucket will be created | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The GCP project ID where resources will be created | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->