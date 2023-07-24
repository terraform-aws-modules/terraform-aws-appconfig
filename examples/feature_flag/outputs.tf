# Application
output "application_arn" {
  description = "The Amazon Resource Name (ARN) of the AppConfig Application"
  value       = module.appconfig.application_arn
}

output "application_id" {
  description = "The AppConfig application ID"
  value       = module.appconfig.application_id
}

# Environments
output "environments" {
  description = "The AppConfig environments"
  value       = module.appconfig.environments
}

# Configuration profile
output "configuration_profile_arn" {
  description = "The Amazon Resource Name (ARN) of the AppConfig Configuration Profile"
  value       = module.appconfig.configuration_profile_arn
}

output "configuration_profile_configuration_profile_id" {
  description = "The configuration profile ID"
  value       = module.appconfig.configuration_profile_configuration_profile_id
}

output "configuration_profile_id" {
  description = "The AppConfig configuration profile ID and application ID separated by a colon (:)"
  value       = module.appconfig.configuration_profile_id
}

# Hosted configuration version
output "hosted_configuration_version_arn" {
  description = "The Amazon Resource Name (ARN) of the AppConfig hosted configuration version"
  value       = module.appconfig.hosted_configuration_version_arn
}

output "hosted_configuration_version_id" {
  description = "The AppConfig application ID, configuration profile ID, and version number separated by a slash (/)"
  value       = module.appconfig.hosted_configuration_version_id
}

output "hosted_configuration_version_version_number" {
  description = "The version number of the hosted configuration"
  value       = module.appconfig.hosted_configuration_version_version_number
}

# Deployment strategy
output "deployment_strategy_arn" {
  description = "The Amazon Resource Name (ARN) of the AppConfig Deployment Strategy"
  value       = module.appconfig.deployment_strategy_arn
}

output "deployment_strategy_id" {
  description = "The AppConfig deployment strategy ID"
  value       = module.appconfig.deployment_strategy_id
}

# Deployment
output "deployments" {
  description = "The AppConfig deployments"
  value       = module.appconfig.deployments
}

# Retrieval role
output "retrieval_role_arn" {
  description = "Amazon Resource Name (ARN) specifying the retrieval role"
  value       = module.appconfig.retrieval_role_arn
}

output "retrieval_role_id" {
  description = "Name of the retrieval role"
  value       = module.appconfig.retrieval_role_id
}

output "retrieval_role_unique_id" {
  description = "Stable and unique string identifying the retrieval role"
  value       = module.appconfig.retrieval_role_unique_id
}

output "retrieval_role_name" {
  description = "Name of the retrieval role"
  value       = module.appconfig.retrieval_role_name
}

output "retrieval_role_policy_arn" {
  description = "The ARN assigned by AWS to the retrieval role policy"
  value       = module.appconfig.retrieval_role_policy_arn
}

output "retrieval_role_policy_id" {
  description = "The ARN assigned by AWS to the retrieval role policy"
  value       = module.appconfig.retrieval_role_policy_id
}

output "retrieval_role_policy_name" {
  description = "The name of the policy"
  value       = module.appconfig.retrieval_role_policy_name
}

output "retrieval_role_policy_policy" {
  description = "The retrieval role policy document"
  value       = module.appconfig.retrieval_role_policy_policy
}

output "retrieval_role_policy_policy_id" {
  description = "The retrieval role policy ID"
  value       = module.appconfig.retrieval_role_policy_policy_id
}
