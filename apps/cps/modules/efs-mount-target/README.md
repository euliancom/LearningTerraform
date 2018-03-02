# efs-mount-target

This module incapsulates provides an Elastic File System (EFS) mount target.

## input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|file_system_id|The ID of the file system for which the mount target is intended.|string||Yes|
|subnet_id|The ID of the subnet to add the mount target in.|string||Yes|
|security_groups|A list of up to 5 VPC security group IDs (that must be for the same VPC as subnet specified) in effect for the mount target.|list||Yes|

## output variables

| Name | Description | Type |
|------|-------------|:----:|
|efs_dns_name|The DNS name for the given subnet/AZ per documented convention.|string|


## Example ##

1. run efs-mount-target module

``` hcl
module "cps_aws_efs_mount_target" {
  source = "git::git@github.com:ThomsonReuters-IPS/cc-terraform-modules.git//efs-mount-target?ref=v0.0.1"

  file_system_id  = "fs-e04acb49"
  subnet_id       = "subnet-992ed7c2"
  security_groups = ["sg-9b0b11e7"]
}
```