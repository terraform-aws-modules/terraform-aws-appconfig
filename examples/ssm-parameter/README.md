# SSM Parameter AWS AppConfig Example

Configuration in this directory creates:

- AWS AppConfig application containing:
  - (x2) AWS AppConfig environments (`nonprod`/`prod`)
  - Configuration stored in an SSM Parameter
  - Lambda validation function

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which will incur monetary charges on your AWS bill. Run `terraform destroy` when you no longer need these resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | >= 2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | >= 2.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_appconfig"></a> [appconfig](#module\_appconfig) | ../../ | n/a |
| <a name="module_validate_lambda"></a> [validate\_lambda](#module\_validate\_lambda) | terraform-aws-modules/lambda/aws | ~> 6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [archive_file.lambda_handler](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_arn"></a> [application\_arn](#output\_application\_arn) | The Amazon Resource Name (ARN) of the AppConfig Application |
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | The AppConfig application ID |
| <a name="output_configuration_profile_arn"></a> [configuration\_profile\_arn](#output\_configuration\_profile\_arn) | The Amazon Resource Name (ARN) of the AppConfig Configuration Profile |
| <a name="output_configuration_profile_configuration_profile_id"></a> [configuration\_profile\_configuration\_profile\_id](#output\_configuration\_profile\_configuration\_profile\_id) | The configuration profile ID |
| <a name="output_configuration_profile_id"></a> [configuration\_profile\_id](#output\_configuration\_profile\_id) | The AppConfig configuration profile ID and application ID separated by a colon (:) |
| <a name="output_deployment_strategy_arn"></a> [deployment\_strategy\_arn](#output\_deployment\_strategy\_arn) | The Amazon Resource Name (ARN) of the AppConfig Deployment Strategy |
| <a name="output_deployment_strategy_id"></a> [deployment\_strategy\_id](#output\_deployment\_strategy\_id) | The AppConfig deployment strategy ID |
| <a name="output_deployments"></a> [deployments](#output\_deployments) | The AppConfig deployments |
| <a name="output_environments"></a> [environments](#output\_environments) | The AppConfig environments |
| <a name="output_hosted_configuration_version_arn"></a> [hosted\_configuration\_version\_arn](#output\_hosted\_configuration\_version\_arn) | The Amazon Resource Name (ARN) of the AppConfig hosted configuration version |
| <a name="output_hosted_configuration_version_id"></a> [hosted\_configuration\_version\_id](#output\_hosted\_configuration\_version\_id) | The AppConfig application ID, configuration profile ID, and version number separated by a slash (/) |
| <a name="output_hosted_configuration_version_version_number"></a> [hosted\_configuration\_version\_version\_number](#output\_hosted\_configuration\_version\_version\_number) | The version number of the hosted configuration |
| <a name="output_retrieval_role_arn"></a> [retrieval\_role\_arn](#output\_retrieval\_role\_arn) | Amazon Resource Name (ARN) specifying the retrieval role |
| <a name="output_retrieval_role_id"></a> [retrieval\_role\_id](#output\_retrieval\_role\_id) | Name of the retrieval role |
| <a name="output_retrieval_role_name"></a> [retrieval\_role\_name](#output\_retrieval\_role\_name) | Name of the retrieval role |
| <a name="output_retrieval_role_policy_arn"></a> [retrieval\_role\_policy\_arn](#output\_retrieval\_role\_policy\_arn) | The ARN assigned by AWS to the retrieval role policy |
| <a name="output_retrieval_role_policy_id"></a> [retrieval\_role\_policy\_id](#output\_retrieval\_role\_policy\_id) | The ARN assigned by AWS to the retrieval role policy |
| <a name="output_retrieval_role_policy_name"></a> [retrieval\_role\_policy\_name](#output\_retrieval\_role\_policy\_name) | The name of the policy |
| <a name="output_retrieval_role_policy_policy"></a> [retrieval\_role\_policy\_policy](#output\_retrieval\_role\_policy\_policy) | The retrieval role policy document |
| <a name="output_retrieval_role_policy_policy_id"></a> [retrieval\_role\_policy\_policy\_id](#output\_retrieval\_role\_policy\_policy\_id) | The retrieval role policy ID |
| <a name="output_retrieval_role_unique_id"></a> [retrieval\_role\_unique\_id](#output\_retrieval\_role\_unique\_id) | Stable and unique string identifying the retrieval role |
<!-- END_TF_DOCS -->

Apache-2.0 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-appconfig/blob/master/LICENSE).
