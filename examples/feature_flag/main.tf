provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
  name   = "appconfig-ex-${replace(basename(path.cwd), "_", "-")}"

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-appconfig"
  }
}

################################################################################
# AppConfig
################################################################################

module "deactivated_appconfig" {
  source = "../../"

  name   = local.name
  create = false
}

module "appconfig" {
  source = "../../"

  name        = local.name
  description = "AppConfig hosted - ${local.name}"

  # environments
  environments = {
    nonprod = {
      name        = "nonprod"
      description = "NonProd environment - ${local.name}"
    },
    prod = {
      name        = "prod"
      description = "Prod environment - ${local.name}"
    }
  }

  # hosted config version
  use_hosted_configuration           = true
  config_profile_type                = "AWS.AppConfig.FeatureFlags"
  hosted_config_version_content_type = "application/json"
  hosted_config_version_content      = file("../_configs/feature_flag.json")

  tags = local.tags
}
