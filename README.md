# Terraform AWS SSM Parameters

This terraform module creates SSM parameters in AWS.

## Usage

```hcl
module "ssm_parameters" {
  source = "git::https://github.com/JManzur/terraform-aws-ssm-parameter.git?ref=vX.X.X"

  create_kms_key          = true
  kms_key_extra_role_arns = "arn:aws:iam::123456789012:role/extra-role-arn"
  ssm_parameter = [
    {
      name        = "/myapp/dev/database/username"
      description = "The username for the database"
      type        = "SecureString"
      value       = var.database_username
    },
    {
      name        = "/myapp/dev/database/password"
      description = "The password for the database"
      type        = "SecureString"
      value       = var.database_password
    },
    {
      name        = "/myapp/vpc/dev/id"
      description = "The VPC ID"
      type        = "String"
      value       = module.vpc.vpc_id
    }
  ]
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_alias.ssm_parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.ssm_parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.ssm_parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_kms_key"></a> [create\_kms\_key](#input\_create\_kms\_key) | [OPTIONAL] If true, a KMS key will be created and used to encrypt the SecureString parameters. | `bool` | `false` | no |
| <a name="input_existing_kms_key_arn"></a> [existing\_kms\_key\_arn](#input\_existing\_kms\_key\_arn) | [OPTIONAL] The ARN of the KMS key to use to encrypt the SecureString parameters. | `string` | `""` | no |
| <a name="input_kms_key_extra_role_arns"></a> [kms\_key\_extra\_role\_arns](#input\_kms\_key\_extra\_role\_arns) | [OPTIONAL] The ARNs of the IAM roles that should be able to use the KMS key. | `list(string)` | n/a | yes |
| <a name="input_ssm_parameter"></a> [ssm\_parameter](#input\_ssm\_parameter) | [Required] A list of maps of SSM parameters to create. The map must contain the following keys:<br>    - name: The name of the parameter.<br>      - Recommended format: /<environment>/<service>/<parameter\_name><br>    - description: The description of the parameter.<br>    - type: The type of the parameter. Valid values are String, StringList, or SecureString.<br>      - Refer to https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_Parameter.html for more information.<br>    - value: The value of the parameter.<br>    - tier: The tier of the parameter. Valid values are Standard, Advanced, or IntelligentTiering.<br>      - Refer to https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html for more information.<br>    - additional\_tags: A map of additional tags to apply to the parameter. | <pre>list(object({<br>    name            = string<br>    description     = string<br>    type            = string<br>    value           = string<br>    tier            = optional(string)<br>    additional_tags = optional(map(string))<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_parameter_arn"></a> [parameter\_arn](#output\_parameter\_arn) | The ARN of the SSM Parameters. |
| <a name="output_parameter_name"></a> [parameter\_name](#output\_parameter\_name) | The Name of the SSM Parameters. |

## Author:

- [@JManzur](https://jmanzur.com)
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->