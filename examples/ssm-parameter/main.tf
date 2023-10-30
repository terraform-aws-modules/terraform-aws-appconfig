provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
  name   = "ex-${basename(path.cwd)}"

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-appconfig"
  }
}

################################################################################
# AppConfig
################################################################################

module "appconfig" {
  source = "../../"

  name        = local.name
  description = "SSM Parameter - ${local.name}"

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
  use_ssm_parameter_configuration = true
  ssm_parameter_configuration_arn = aws_ssm_parameter.config.arn
  retrieval_role_description      = "Role to retrieve configuration stored in SSM parameter"
  config_profile_location_uri     = "ssm-parameter://${aws_ssm_parameter.config.name}"
  config_profile_validator = [{
    # # SSM parameters do not require a validation method, but it is recommended that you create a validation check
    # # for new or updated SSM parameter configurations by using AWS Lambda.
    #   type    = "JSON_SCHEMA"
    #   content = file("../_configs/config_validator.json")
    # }, {
    type    = "LAMBDA"
    content = module.validate_lambda.lambda_function_arn
  }]

  # deployment
  deployment_configuration_version = aws_ssm_parameter.config.version

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

data "archive_file" "lambda_handler" {
  type        = "zip"
  source_file = "../_configs/validate.py"
  output_path = "../_configs/validate.zip"
}

module "validate_lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 6.0"

  function_name = local.name
  description   = "Configuration semantic validation lambda"
  handler       = "validate.handler"
  runtime       = "python3.9"
  publish       = true
  memory_size   = 512
  timeout       = 120

  cloudwatch_logs_retention_in_days = 7
  attach_tracing_policy             = true
  tracing_mode                      = "Active"

  create_package         = false
  local_existing_package = data.archive_file.lambda_handler.output_path

  allowed_triggers = {
    AppConfig = {
      service = "appconfig"
    },
  }

  tags = local.tags
}

resource "aws_ssm_parameter" "config" {
  name        = local.name
  description = "Example SSM parameter for ${local.name}"

  type  = "String"
  value = jsonencode(file("../_configs/config.json"))

  tags = local.tags
}
