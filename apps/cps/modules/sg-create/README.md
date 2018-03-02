# sg-create

This module incapsulates provides a security group resource.

## input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|name|The name of the field to filter by, as defined by the underlying AWS API.|string||Yes|
|description|The description of the security group.|string||Yes|
|vpc_id|The id of the VPC that the desired security group belongs to.|string||Yes|
|tag_name|tag:Name|string||No|

## output variables

| Name | Description | Type |
|------|-------------|:----:|
|sg_id|The id of the specific security group to retrieve.|string|


## Example ##

1. run sg-create module

``` hcl
module "cps_aws_security_group" {
  source = "git::git@github.com:ThomsonReuters-IPS/cc-terraform-modules.git//sg-create?ref=v0.0.1"

  name        = "EFS"
  description = "Managed_by_terraform"
  vpc_id      = "vpc-15764e72"
  tag_name    = "EFS"
}
```