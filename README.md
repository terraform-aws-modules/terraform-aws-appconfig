# AWS AppConfig Terraform module

Terraform module which creates AWS AppConfig resources.

## Usage

See [`examples`](https://github.com/terraform-aws-modules/terraform-aws-appconfig/tree/master/examples) directory for working examples to reference:

```hcl
module "appconfig" {
  source  = "terraform-aws-modules/appconfig/aws"

  name        = "example"
  description = "AppConfig hosted configuration"

  # environments
  environments = {
    nonprod = {
      name        = "nonprod"
      description = "Non-production environment"
    },
    prod = {
      name        = "prod"
      description = "Production environment"
    }
  }

  # hosted config version
  use_hosted_configuration           = true
  hosted_config_version_content_type = "application/json"
  hosted_config_version_content = jsonencode({
    isEnabled     = false,
    messageOption = "ItWorks!"
  })

  # configuration profile
  config_profile_validator = [{
    type = "JSON_SCHEMA"
    content = jsonencode({
      "$schema" = "http://json-schema.org/draft-04/schema#",
      type      = "object",
      properties = {
        isEnabled = {
          type = "boolean"
        },
        messageOption = {
          type    = "string",
          minimum = 0
        }
      },
      additionalProperties = false,
      required             = ["isEnabled", "messageOption"]
    }) }, {
    type    = "LAMBDA"
    content = "arn:aws:lambda:us-east-1:123456789101:function:example-appconfig-hosted"
  }]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## Examples

Examples codified under the [`examples`](https://github.com/terraform-aws-modules/terraform-aws-appconfig/tree/master/examples) are intended
 give users references for how to use the module(s) as well as testing/validating changes to the source code of the module(s). If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow maintainers to test your changes and to keep the examples up to date for users. Thank you!

- [AppConfig Hosted](https://github.com/terraform-aws-modules/terraform-aws-appconfig/tree/master/examples/appconfig-hosted)
- [S3](https://github.com/terraform-aws-modules/terraform-aws-appconfig/tree/master/examples/s3)
- [SSM Document](https://github.com/terraform-aws-modules/terraform-aws-appconfig/tree/master/examples/ssm-document)
- [SSM Parameter](https://github.com/terraform-aws-modules/terraform-aws-appconfig/tree/master/examples/ssm-parameter)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_appconfig_application.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appconfig_application) | resource |
| [aws_appconfig_configuration_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appconfig_configuration_profile) | resource |
| [aws_appconfig_deployment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appconfig_deployment) | resource |
| [aws_appconfig_deployment_strategy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appconfig_deployment_strategy) | resource |
| [aws_appconfig_environment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appconfig_environment) | resource |
| [aws_appconfig_hosted_configuration_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appconfig_hosted_configuration_version) | resource |
| [aws_iam_policy.retrieval](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.retrieval](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.retrieval](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.retreival](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.retrieval_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.retrieval_ssm_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.retrieval_ssm_parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_profile_description"></a> [config\_profile\_description](#input\_config\_profile\_description) | The description of the configuration profile. Can be at most 1024 characters | `string` | `null` | no |
| <a name="input_config_profile_location_uri"></a> [config\_profile\_location\_uri](#input\_config\_profile\_location\_uri) | A URI to locate the configuration. You can specify the AWS AppConfig hosted configuration store, Systems Manager (SSM) document, an SSM Parameter Store parameter, or an Amazon S3 object | `string` | `"hosted"` | no |
| <a name="input_config_profile_name"></a> [config\_profile\_name](#input\_config\_profile\_name) | The name for the configuration profile. Must be between 1 and 64 characters in length | `string` | `null` | no |
| <a name="input_config_profile_retrieval_role_arn"></a> [config\_profile\_retrieval\_role\_arn](#input\_config\_profile\_retrieval\_role\_arn) | The ARN of an IAM role with permission to access the configuration at the specified `location_uri`. A retrieval role ARN is not required for configurations stored in the AWS AppConfig `hosted` configuration store. It is required for all other sources that store your configuration | `string` | `null` | no |
| <a name="input_config_profile_tags"></a> [config\_profile\_tags](#input\_config\_profile\_tags) | A map of additional tags to apply to the configuration profile | `map(string)` | `{}` | no |
| <a name="input_config_profile_type"></a> [config\_profile\_type](#input\_config\_profile\_type) | Type of configurations contained in the profile. Valid values: `AWS.AppConfig.FeatureFlags` and `AWS.Freeform` | `string` | `null` | no |
| <a name="input_config_profile_validator"></a> [config\_profile\_validator](#input\_config\_profile\_validator) | A set of methods for validating the configuration. Maximum of 2 | `list(map(any))` | `[]` | no |
| <a name="input_create"></a> [create](#input\_create) | Determines whether resources are created | `bool` | `true` | no |
| <a name="input_create_deployment_strategy"></a> [create\_deployment\_strategy](#input\_create\_deployment\_strategy) | Determines whether a deployment strategy is created | `bool` | `true` | no |
| <a name="input_create_retrieval_role"></a> [create\_retrieval\_role](#input\_create\_retrieval\_role) | Determines whether configuration retrieval IAM role is created | `bool` | `true` | no |
| <a name="input_deployment_configuration_version"></a> [deployment\_configuration\_version](#input\_deployment\_configuration\_version) | The configuration version to deploy. Can be at most 1024 characters | `string` | `null` | no |
| <a name="input_deployment_description"></a> [deployment\_description](#input\_deployment\_description) | A description of the deployment. Can be at most 1024 characters | `string` | `null` | no |
| <a name="input_deployment_strategy_deployment_duration_in_minutes"></a> [deployment\_strategy\_deployment\_duration\_in\_minutes](#input\_deployment\_strategy\_deployment\_duration\_in\_minutes) | Total amount of time for a deployment to last. Minimum value of 0, maximum value of 1440 | `number` | `0` | no |
| <a name="input_deployment_strategy_description"></a> [deployment\_strategy\_description](#input\_deployment\_strategy\_description) | A description of the deployment strategy. Can be at most 1024 characters | `string` | `null` | no |
| <a name="input_deployment_strategy_final_bake_time_in_minutes"></a> [deployment\_strategy\_final\_bake\_time\_in\_minutes](#input\_deployment\_strategy\_final\_bake\_time\_in\_minutes) | Total amount of time for a deployment to last. Minimum value of 0, maximum value of 1440 | `number` | `0` | no |
| <a name="input_deployment_strategy_growth_factor"></a> [deployment\_strategy\_growth\_factor](#input\_deployment\_strategy\_growth\_factor) | The percentage of targets to receive a deployed configuration during each interval. Minimum value of 1, maximum value of 100 | `number` | `100` | no |
| <a name="input_deployment_strategy_growth_type"></a> [deployment\_strategy\_growth\_type](#input\_deployment\_strategy\_growth\_type) | The algorithm used to define how percentage grows over time. Valid value: `LINEAR` and `EXPONENTIAL`. Defaults to `LINEAR` | `string` | `null` | no |
| <a name="input_deployment_strategy_id"></a> [deployment\_strategy\_id](#input\_deployment\_strategy\_id) | An existing AppConfig deployment strategy ID | `string` | `null` | no |
| <a name="input_deployment_strategy_name"></a> [deployment\_strategy\_name](#input\_deployment\_strategy\_name) | A name for the deployment strategy. Must be between 1 and 64 characters in length | `string` | `null` | no |
| <a name="input_deployment_strategy_replicate_to"></a> [deployment\_strategy\_replicate\_to](#input\_deployment\_strategy\_replicate\_to) | Where to save the deployment strategy. Valid values: `NONE` and `SSM_DOCUMENT` | `string` | `"NONE"` | no |
| <a name="input_deployment_strategy_tags"></a> [deployment\_strategy\_tags](#input\_deployment\_strategy\_tags) | A map of additional tags to apply to the deployment strategy | `map(string)` | `{}` | no |
| <a name="input_deployment_tags"></a> [deployment\_tags](#input\_deployment\_tags) | A map of additional tags to apply to the deployment | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the application. Can be at most 1024 characters | `string` | `null` | no |
| <a name="input_environments"></a> [environments](#input\_environments) | Map of attributes for AppConfig environment resource(s) | `map(any)` | `{}` | no |
| <a name="input_hosted_config_version_content"></a> [hosted\_config\_version\_content](#input\_hosted\_config\_version\_content) | The content of the configuration or the configuration data | `string` | `null` | no |
| <a name="input_hosted_config_version_content_type"></a> [hosted\_config\_version\_content\_type](#input\_hosted\_config\_version\_content\_type) | A standard MIME type describing the format of the configuration content. For more information, see [Content-Type](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17) | `string` | `null` | no |
| <a name="input_hosted_config_version_description"></a> [hosted\_config\_version\_description](#input\_hosted\_config\_version\_description) | A description of the configuration | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the application. Must be between 1 and 64 characters in length | `string` | `""` | no |
| <a name="input_retrieval_role_description"></a> [retrieval\_role\_description](#input\_retrieval\_role\_description) | Description of the configuration retrieval role | `string` | `null` | no |
| <a name="input_retrieval_role_name"></a> [retrieval\_role\_name](#input\_retrieval\_role\_name) | The name for the configuration retrieval role | `string` | `""` | no |
| <a name="input_retrieval_role_path"></a> [retrieval\_role\_path](#input\_retrieval\_role\_path) | Path to the configuration retrieval role | `string` | `null` | no |
| <a name="input_retrieval_role_permissions_boundary"></a> [retrieval\_role\_permissions\_boundary](#input\_retrieval\_role\_permissions\_boundary) | ARN of the policy that is used to set the permissions boundary for the configuration retrieval role | `string` | `null` | no |
| <a name="input_retrieval_role_tags"></a> [retrieval\_role\_tags](#input\_retrieval\_role\_tags) | A map of additional tags to apply to the configuration retrieval role | `map(string)` | `{}` | no |
| <a name="input_retrieval_role_use_name_prefix"></a> [retrieval\_role\_use\_name\_prefix](#input\_retrieval\_role\_use\_name\_prefix) | Determines whether to a name or name-prefix strategy is used on the role | `bool` | `true` | no |
| <a name="input_s3_configuration_bucket_arn"></a> [s3\_configuration\_bucket\_arn](#input\_s3\_configuration\_bucket\_arn) | The ARN of the configuration S3 bucket | `string` | `null` | no |
| <a name="input_s3_configuration_object_key"></a> [s3\_configuration\_object\_key](#input\_s3\_configuration\_object\_key) | Name of the configuration object/file stored in the S3 bucket | `string` | `"*"` | no |
| <a name="input_ssm_document_configuration_arn"></a> [ssm\_document\_configuration\_arn](#input\_ssm\_document\_configuration\_arn) | ARN of the configuration SSM document | `string` | `null` | no |
| <a name="input_ssm_parameter_configuration_arn"></a> [ssm\_parameter\_configuration\_arn](#input\_ssm\_parameter\_configuration\_arn) | ARN of the configuration SSM parameter | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tag blocks. Each element should have keys named key, value, and propagate\_at\_launch | `map(string)` | `{}` | no |
| <a name="input_use_hosted_configuration"></a> [use\_hosted\_configuration](#input\_use\_hosted\_configuration) | Determines whether a hosted configuration is used | `bool` | `false` | no |
| <a name="input_use_s3_configuration"></a> [use\_s3\_configuration](#input\_use\_s3\_configuration) | Determines whether an S3 configuration is used | `bool` | `false` | no |
| <a name="input_use_ssm_document_configuration"></a> [use\_ssm\_document\_configuration](#input\_use\_ssm\_document\_configuration) | Determines whether an SSM document configuration is used | `bool` | `false` | no |
| <a name="input_use_ssm_parameter_configuration"></a> [use\_ssm\_parameter\_configuration](#input\_use\_ssm\_parameter\_configuration) | Determines whether an SSM parameter configuration is used | `bool` | `false` | no |

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

## License

Apache-2.0 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-appconfig/blob/master/LICENSE).
