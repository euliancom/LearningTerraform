#####################
# account variables #
#####################

variable "region" {}
variable "account_id" {}
variable "env" {}

######################
# CPS security group #
######################

variable "cps_sg_name" {}
variable "cps_sg_description" {}
variable "cps_sg_tag_name" {}

############################
# CPS security group rules #
############################

variable "cps_sg_rule_ports_tcp" {}
variable "cps_sg_rule_ports_all" {}
variable "cps_sg_rule_ports_to_cidr_tcp" {}
variable "cps_sg_rule_ports_to_cidr_all" {}

######################
# EFS security group #
######################

variable "efs_sg_name" {}
variable "efs_sg_description" {}
variable "efs_sg_tag_name" {}

############################
# EFS security group rules #
############################

variable "efs_sg_rule_ports_tcp" {}
variable "efs_sg_rule_ports_to_cidr_all" {}
variable "efs_sg_rule_ports_to_sg" {}

#######################
# CPS efs file system #
#######################

variable "cps_efs_file_system_creation_token" {}
variable "cps_efs_file_system_name" {}

###############################
# CPS efs file system nondata #
###############################

variable "nondata_efs_file_system_creation_token" {}
variable "nondata_efs_file_system_name" {}

####################
# common variables #
####################

variable "aws_iam_instance_profile" {}
variable "key_name" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "infra_bastion_sg" {}

###########
# ec2 cps #
###########

variable "cps_ami_id" {}
variable "cps_ag_ami_id" {}
variable "cps_instance_type" {}
variable "cps_instance_count" {}
variable "cps_instance_name" {}

###########
# efs elb #
###########

variable "cps_elb_count" {}
variable "efs_elb_names" {}
variable "cps_instance_ports" {}
variable "dns_zone_name" {}

##############
# ec2 jscape #
##############

variable "cps_jscape_ami_id" {}
variable "cps_jscape_instance_type" {}
variable "cps_jscape_instance_count" {}
variable "cps_jscape_instance_name" {}
variable "cps_jscape_private_ips" {}

###########
# efs elb #
###########

variable "efs_elb_name" {}
variable "cps_jscape_elb_port" {}
variable "cps_jscape_instance_port" {}
variable "efs_elb_internal" {}
variable "efs_elb_tag_name" {}

