# cps

This module incapsulates CPS modules like:
	1. ec2-create-multiple-with-provisioner
	2. efs-file-system
	3. efs-mount-target
	4. elb-create
	5. sg-create
	6. sg-rules-to-from-sg
	7. sg-rules-with-cidr
	8. sg-rules-without-cidr

## input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
||
|sg_rule_type_ingress|Valid options are ingress (inbound).|string|ingress|No|
|sg_rule_type_egress|Valid options are egress (outbound).|string|egress|No|
|sg_rule_protocol_tcp|The protocol tcp.|string|tcp|No|
|sg_rule_protocol_all|The protocol all.|string|-1|No|
|sg_rule_self|If true, the security group itself will be added as a source to this ingress rule.|string|true|No|
|sg_cidr_blocks|List of CIDR blocks. Cannot be specified with source_security_group_id.|string|0.0.0.0/0|No|
||
|cps_sg_name|CPS Aws Security Group name.|string||Yes|
|cps_sg_description|CPS Aws Security Group description.|string||Yes|
|cps_sg_tag_name|CPS Aws Security Group tag:Name.|string||Yes|
||
|cps_sg_rule_ports_tcp|Add CPS Aws Security Group rules with type = ingress and protocol = tcp.|list||Yes|
|cps_sg_rule_ports_all|Add CPS Aws Security Group rules with type = ingress and protocol = -1.|list||Yes|
|cps_sg_rule_ports_to_cidr_tcp|Add CPS Aws Security Group rules with type = ingress, protocol = tcp and cidr = 0.0.0.0/0.|list||Yes|
|cps_sg_rule_ports_to_cidr_all|Add CPS Aws Security Group rules with type = egress, protocol = -1 and cidr = 0.0.0.0/0.|list||Yes|
||
|efs_sg_name|EFS Aws Security Group name.|string||Yes|
|efs_sg_description|EFS Aws Security Group description.|string||Yes|
|efs_sg_tag_name|EFS Aws Security Group tag:Name.|string||Yes|
||
|efs_sg_rule_ports_tcp|Add EFS Aws Security Group rules with type = ingress and protocol = tcp.|list||Yes|
|efs_sg_rule_ports_to_cidr_all|Add EFS Aws Security Group rules with type = egress, protocol = -1 and cidr = 0.0.0.0/0.|list||Yes|
|efs_sg_rule_ports_to_sg|Add EFS Aws Security Group rules with type = ingress, protocol = -1 and source_security_group_id = cps_sg.|list||Yes|
||
|cps_efs_file_system_creation_token|A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation.|string||Yes|
|cps_efs_file_system_name|Elastic File System tag:Name.|string||Yes|
||
|key_name|The key name of the Instances.|string||Yes|
|vpc_id|This is the AWS VPC Id.|string||Yes|
|subnet_id|This is the AWS Subnet Id.|string||Yes|
|infra_bastion_sg|Infra Bastion Security Group Id.|string||Yes|
||
|cps_ami_id|The AMI to use for the CPS instances.|string||Yes|
|cps_instance_type|The type of CPS instances to start.|string||Yes|
|cps_instance_count|Count of CPS instances.|string||Yes|
|cps_instance_name|The name of CPS instances.|string||Yes|
||
|cps_jscape_ami_id|The AMI to use for the JSCAPE instances.|string||Yes|
|cps_jscape_instance_type|The type of JSCAPE instances to start.|string||Yes|
|cps_jscape_private_ips|The JSCAPE Private IPs|list||Yes|
|cps_jscape_instance_count|Count of JSCAPE instances.|string||Yes|
|cps_jscape_instance_name|The name of JSCAPE instances.|string||Yes|
||
|efs_elb_name|The JSCAPE ELB name.|string||Yes|
|efs_elb_internal|The JSCAPE ELB name.|string||Yes|
|efs_elb_tag_name|The JSCAPE ELB tag:Name.|string||Yes|
|cps_jscape_elb_port|The JSCAPE ELB port.|string||Yes|
|cps_jscape_instance_port|The JSCAPE instance port.|string||Yes|


## Example ##

1. run cps module

``` hcl
module "cps" {
  source = "git::git@github.com:ThomsonReuters-IPS/cc-terraform-modules.git//cps?ref=v0.0.1"

  ######################
  # CPS security group #
  ######################

  cps_sg_name        = "TF-CPS-SG"
  cps_sg_description = "Managed_by_terraform"
  cps_sg_tag_name    = "TF-CPS-SG"

  ############################
  # CPS security group rules #
  ############################

  cps_sg_rule_ports_tcp         = [9521,8521]
  cps_sg_rule_ports_all         = [0]
  cps_sg_rule_ports_to_cidr_tcp = [21,80]
  cps_sg_rule_ports_to_cidr_all = [0]

  ######################
  # EFS security group #
  ######################

  efs_sg_name        = "EFS"
  efs_sg_description = "Managed_by_terraform"
  efs_sg_tag_name    = "EFS"

  ############################
  # EFS security group rules #
  ############################

  efs_sg_rule_ports_tcp         = [2049]
  efs_sg_rule_ports_to_cidr_all = [0]
  efs_sg_rule_ports_to_sg       = [0]

  #######################
  # CPS efs file system #
  #######################

  cps_efs_file_system_creation_token = "dev-cps"
  cps_efs_file_system_name           = "TF-CPS"

  ####################
  # common variables #
  ####################

  key_name         = "KPcontentcloud_developer"  
  vpc_id           = "vpc-9017a2f4"
  subnet_id        = "subnet-84e4b1e0"
  infra_bastion_sg = "sg-4f4c5c37"

  ###########
  # ec2 cps #
  ###########

  cps_ami_id         = "ami-3d61d745"
  cps_instance_type  = "t2.large"
  cps_instance_count = 1
  cps_instance_name  = "TF-CPS"

  ##############
  # ec2 jscape #
  ##############

  cps_jscape_ami_id         = "ami-6b9f4613"
  cps_jscape_instance_type  = "m4.large"
  cps_jscape_instance_count = 1
  cps_jscape_instance_name  = "TF-CPS-JSCAPE"
  cps_jscape_private_ips    = ["10.152.52.30"]

  ###########
  # efs elb #
  ###########

  efs_elb_name             = "tf-cps-jscape"
  efs_elb_internal         = true
  efs_elb_tag_name         = "cps-jscape-terraform-elb"
  cps_jscape_elb_port      = 11880
  cps_jscape_instance_port = 11880
}

```