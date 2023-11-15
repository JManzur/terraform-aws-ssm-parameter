output "parameter_arn" {
  description = "The ARN of the SSM Parameters."
  value       = { for arn, parameter in aws_ssm_parameter.this : arn => parameter.arn }
}

output "parameter_name" {
  description = "The Name of the SSM Parameters."
  value       = { for name, parameter in aws_ssm_parameter.this : name => parameter.name }
}