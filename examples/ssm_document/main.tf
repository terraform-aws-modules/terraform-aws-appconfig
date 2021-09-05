provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
  name   = "example2-${replace(basename(path.cwd), "_", "-")}"

  tags = {
    Example     = local.name
    Environment = "dev"
  }
}

################################################################################
# Supporting Resources
################################################################################

resource "aws_ssm_document" "config_schema" {
  name            = local.name
  content         = file("../_configs/config_validator.json")
  document_format = "JSON"
  document_type   = "ApplicationConfigurationSchema"

  tags = local.tags
}

resource "aws_ssm_document" "config" {
  name            = local.name
  content         = file("../_configs/config.json")
  document_format = "JSON"
  document_type   = "ApplicationConfiguration"
  # NOTE - this does not work - it is not supported in the AWS provider yet
  # However, the AWS API requires something like this
  # document_requires = [{
  #   name    = aws_ssm_document.config_schema.name
  #   version = aws_ssm_document.config_schema.latest_version
  # }]

  tags = local.tags
}

################################################################################
# AppConfig
################################################################################

module "appconfig" {
  source = "../../"

  name        = local.name
  description = "SSM Document - ${local.name}"

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

  # configuration profile
  use_ssm_document_configuration = true
  ssm_document_configuration_arn = aws_ssm_document.config.arn
  retrieval_role_description     = "Role to retrieve configuration stored in SSM document"
  config_profile_location_uri    = "ssm-document://${aws_ssm_document.config.name}"
  config_profile_validator = [{
    type    = "JSON_SCHEMA"
    content = aws_ssm_document.config_schema.content
  }]

  # deployment
  deployment_configuration_version = aws_ssm_document.config.latest_version

  tags = local.tags
}
