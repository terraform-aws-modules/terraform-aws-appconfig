variable "create" {
  description = "Determines whether resources are created"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, and propagate_at_launch"
  type        = map(string)
  default     = {}
}

# Application
variable "name" {
  description = "The name for the application. Must be between 1 and 64 characters in length"
  type        = string
  default     = ""
}

variable "description" {
  description = "The description of the application. Can be at most 1024 characters"
  type        = string
  default     = null
}

# Environment
variable "environments" {
  description = "Map of attributes for AppConfig environment resource(s)"
  type        = map(any)
  default     = {}
}

# Configuration profile
variable "config_profile_name" {
  description = "The name for the configuration profile. Must be between 1 and 64 characters in length"
  type        = string
  default     = null
}

variable "config_profile_description" {
  description = "The description of the configuration profile. Can be at most 1024 characters"
  type        = string
  default     = null
}

variable "config_profile_type" {
  description = "Type of configurations contained in the profile. Valid values: `AWS.AppConfig.FeatureFlags` and `AWS.Freeform`"
  type        = string
  default     = null
}

variable "config_profile_location_uri" {
  description = "A URI to locate the configuration. You can specify the AWS AppConfig hosted configuration store, Systems Manager (SSM) document, an SSM Parameter Store parameter, or an Amazon S3 object"
  type        = string
  default     = "hosted"
}

variable "config_profile_retrieval_role_arn" {
  description = "The ARN of an IAM role with permission to access the configuration at the specified `location_uri`. A retrieval role ARN is not required for configurations stored in the AWS AppConfig `hosted` configuration store. It is required for all other sources that store your configuration"
  type        = string
  default     = null
}

variable "config_profile_validator" {
  description = "A set of methods for validating the configuration. Maximum of 2"
  type        = list(map(any))
  default     = []
}

variable "config_profile_tags" {
  description = "A map of additional tags to apply to the configuration profile"
  type        = map(string)
  default     = {}
}

# Configuration retrieval role
variable "create_retrieval_role" {
  description = "Determines whether configuration retrieval IAM role is created"
  type        = bool
  default     = true
}

variable "retrieval_role_name" {
  description = "The name for the configuration retrieval role"
  type        = string
  default     = ""
}

variable "retrieval_role_use_name_prefix" {
  description = "Determines whether to a name or name-prefix strategy is used on the role"
  type        = bool
  default     = true
}

variable "retrieval_role_description" {
  description = "Description of the configuration retrieval role"
  type        = string
  default     = null
}

variable "retrieval_role_path" {
  description = "Path to the configuration retrieval role"
  type        = string
  default     = null
}

variable "retrieval_role_permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the configuration retrieval role"
  type        = string
  default     = null
}

variable "ssm_parameter_configuration_arn" {
  description = "ARN of the configuration SSM parameter"
  type        = string
  default     = null
}

variable "ssm_document_configuration_arn" {
  description = "ARN of the configuration SSM document"
  type        = string
  default     = null
}

variable "s3_configuration_bucket_arn" {
  description = "The ARN of the configuration S3 bucket"
  type        = string
  default     = null
}

variable "s3_configuration_object_key" {
  description = "Name of the configuration object/file stored in the S3 bucket"
  type        = string
  default     = "*"
}

variable "retrieval_role_tags" {
  description = "A map of additional tags to apply to the configuration retrieval role"
  type        = map(string)
  default     = {}
}

# Configuration version
variable "use_hosted_configuration" {
  description = "Determines whether a hosted configuration is used"
  type        = bool
  default     = false
}

variable "use_ssm_parameter_configuration" {
  description = "Determines whether an SSM parameter configuration is used"
  type        = bool
  default     = false
}

variable "use_ssm_document_configuration" {
  description = "Determines whether an SSM document configuration is used"
  type        = bool
  default     = false
}

variable "use_s3_configuration" {
  description = "Determines whether an S3 configuration is used"
  type        = bool
  default     = false
}

variable "hosted_config_version_description" {
  description = "A description of the configuration"
  type        = string
  default     = null
}

variable "hosted_config_version_content" {
  description = "The content of the configuration or the configuration data"
  type        = string
  default     = null
}

variable "hosted_config_version_content_type" {
  description = "A standard MIME type describing the format of the configuration content. For more information, see [Content-Type](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.17)"
  type        = string
  default     = null
}

# Deployment strategy
variable "create_deployment_strategy" {
  description = "Determines whether a deployment strategy is created"
  type        = bool
  default     = true
}

variable "deployment_strategy_id" {
  description = "An existing AppConfig deployment strategy ID"
  type        = string
  default     = null
}

variable "deployment_strategy_name" {
  description = "A name for the deployment strategy. Must be between 1 and 64 characters in length"
  type        = string
  default     = null
}

variable "deployment_strategy_description" {
  description = "A description of the deployment strategy. Can be at most 1024 characters"
  type        = string
  default     = null
}

variable "deployment_strategy_deployment_duration_in_minutes" {
  description = "Total amount of time for a deployment to last. Minimum value of 0, maximum value of 1440"
  type        = number
  default     = 0
}

variable "deployment_strategy_final_bake_time_in_minutes" {
  description = "Total amount of time for a deployment to last. Minimum value of 0, maximum value of 1440"
  type        = number
  default     = 0
}

variable "deployment_strategy_growth_factor" {
  description = "The percentage of targets to receive a deployed configuration during each interval. Minimum value of 1, maximum value of 100"
  type        = number
  default     = 100
}

variable "deployment_strategy_growth_type" {
  description = "The algorithm used to define how percentage grows over time. Valid value: `LINEAR` and `EXPONENTIAL`. Defaults to `LINEAR`"
  type        = string
  default     = null
}

variable "deployment_strategy_replicate_to" {
  description = "Where to save the deployment strategy. Valid values: `NONE` and `SSM_DOCUMENT`"
  type        = string
  default     = "NONE"
}

variable "deployment_strategy_tags" {
  description = "A map of additional tags to apply to the deployment strategy"
  type        = map(string)
  default     = {}
}

# Deployment
variable "deployment_description" {
  description = "A description of the deployment. Can be at most 1024 characters"
  type        = string
  default     = null
}

variable "deployment_configuration_version" {
  description = "The configuration version to deploy. Can be at most 1024 characters"
  type        = string
  default     = null
}

variable "deployment_tags" {
  description = "A map of additional tags to apply to the deployment"
  type        = map(string)
  default     = {}
}
