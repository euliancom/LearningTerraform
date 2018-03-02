# ec2-create-multiple-with-private-ip

This module incapsulates create multiple ec2 with private ip.

## input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|ami_id|The AMI to use for the instance.|string||Yes|
|instance_type|The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance.|string||Yes|
|instance_count|The count of similar instances.|string||Yes|
|name|tag:Name|string||Yes|
|subnet_id|The VPC Subnet ID to launch in.|string||Yes|
|private_ips|Private IPs address to associate with the instance in a VPC.|list||Yes|
|key_name|The key name to use for the instance.|string||Yes|
|security_group_ids|A list of security group IDs to associate with.|string||Yes|
|ec2_user_data|The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead.|string||Yes|

## output variables

| Name | Description | Type |
|------|-------------|:----:|
|instance_id|The instance ID.|list|
|instance_private_ip|The private IP address assigned to the instance.|list|


## Example ##

1. run ec2-create-multiple-with-private-ip module

``` hcl
module "cps_ec2" {
  source = "git::git@github.com:ThomsonReuters-IPS/cc-terraform-modules.git//ec2-create-multiple-with-private-ip?ref=v0.0.1"

  ami_id         = "ami-3d61d745"
  instance_type  = "t2.large"
  instance_count = 1
  name           = "TF-CPS"

  subnet_id          = "subnet-84e4b1e0"
  private_ips        = ["10.152.59.31"]
  key_name           = "KPcontentcloud_developer"
  security_group_ids = ["sg-80150ffc","sg-61a6691b","sg-9b0b11e7"]

  ec2_user_data = "06c6fc28f42e8e024fe930303b02bf6a4a9731c5"
}
```