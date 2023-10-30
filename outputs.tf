# Application
output "application_arn" {
  description = "The Amazon Resource Name (ARN) of the AppConfig Application"
  value       = try(aws_appconfig_application.this[0].arn, null)
}

output "application_id" {
  description = "The AppConfig application ID"
  value       = try(aws_appconfig_application.this[0].id, null)
}

# Environments
output "environments" {
  description = "The AppConfig environments"
  value       = aws_appconfig_environment.this
}

# Configuration profile
output "configuration_profile_arn" {
  description = "The Amazon Resource Name (ARN) of the AppConfig Configuration Profile"
  value       = try(aws_appconfig_configuration_profile.this[0].arn, null)
}

output "configuration_profile_configuration_profile_id" {
  description = "The configuration profile ID"
  value       = try(aws_appconfig_configuration_profile.this[0].configuration_profile_id, null)
}

output "configuration_profile_id" {
  description = "The AppConfig configuration profile ID and application ID separated by a colon (:)"
  value       = try(aws_appconfig_configuration_profile.this[0].id, null)
}

# Hosted configuration version
output "hosted_configuration_version_arn" {
  description = "The Amazon Resource Name (ARN) of the AppConfig hosted configuration version"
  value       = try(aws_appconfig_hosted_configuration_version.this[0].arn, null)
}

output "hosted_configuration_version_id" {
  description = "The AppConfig application ID, configuration profile ID, and version number separated by a slash (/)"
  value       = try(aws_appconfig_hosted_configuration_version.this[0].id, null)
}

output "hosted_configuration_version_version_number" {
  description = "The version number of the hosted configuration"
  value       = try(aws_appconfig_hosted_configuration_version.this[0].version_number, null)
}

# Deployment strategy
output "deployment_strategy_arn" {
  description = "The Amazon Resource Name (ARN) of the AppConfig Deployment Strategy"
  value       = try(aws_appconfig_deployment_strategy.this[0].arn, null)
}

output "deployment_strategy_id" {
  description = "The AppConfig deployment strategy ID"
  value       = try(aws_appconfig_deployment_strategy.this[0].id, null)
}

# Deployment
output "deployments" {
  description = "The AppConfig deployments"
  value       = aws_appconfig_deployment.this
}

# Retrieval role
output "retrieval_role_arn" {
  description = "Amazon Resource Name (ARN) specifying the retrieval role"
  value       = try(aws_iam_role.retrieval[0].arn, null)
}

output "retrieval_role_id" {
  description = "Name of the retrieval role"
  value       = try(aws_iam_role.retrieval[0].id, null)
}

output "retrieval_role_unique_id" {
  description = "Stable and unique string identifying the retrieval role"
  value       = try(aws_iam_role.retrieval[0].unique_id, null)
}

output "retrieval_role_name" {
  description = "Name of the retrieval role"
  value       = try(aws_iam_role.retrieval[0].name, null)
}

output "retrieval_role_policy_arn" {
  description = "The ARN assigned by AWS to the retrieval role policy"
  value       = try(aws_iam_policy.retrieval[0].arn, null)
}

output "retrieval_role_policy_id" {
  description = "The ARN assigned by AWS to the retrieval role policy"
  value       = try(aws_iam_policy.retrieval[0].id, null)
}

output "retrieval_role_policy_name" {
  description = "The name of the policy"
  value       = try(aws_iam_policy.retrieval[0].name, null)
}

output "retrieval_role_policy_policy" {
  description = "The retrieval role policy document"
  value       = try(aws_iam_policy.retrieval[0].policy, null)
}

output "retrieval_role_policy_policy_id" {
  description = "The retrieval role policy ID"
  value       = try(aws_iam_policy.retrieval[0].policy_id, null)
}
