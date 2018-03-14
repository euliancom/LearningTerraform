variable "env" {}

##################
# security group #
##################
variable "sg_rule_type_ingress" {
  default = "ingress"
}

variable "sg_rule_type_egress" {
  default = "egress"
}

variable "sg_rule_protocol_tcp" {
  default = "tcp"
}

variable "sg_rule_protocol_all" {
  default = "-1"
}

variable "sg_rule_self" {
  default = "true"
}

variable "sg_cidr_blocks" {
  default = "0.0.0.0/0"
}

######################
# CPS security group #
######################

variable "cps_sg_name" {}
variable "cps_sg_description" {}
variable "cps_sg_tag_name" {}

############################
# CPS security group rules #
############################

variable "cps_sg_rule_ports_tcp" {
  type = "list"
}

variable "cps_sg_rule_ports_all" {
  type = "list"
}

variable "cps_sg_rule_ports_to_cidr_tcp" {
  type = "list"
}

variable "cps_sg_rule_ports_to_cidr_all" {
  type = "list"
}

######################
# EFS security group #
######################

variable "efs_sg_name" {}
variable "efs_sg_description" {}
variable "efs_sg_tag_name" {}

############################
# EFS security group rules #
############################

variable "efs_sg_rule_ports_tcp" {
  type = "list"
}

variable "efs_sg_rule_ports_to_cidr_all" {
  type = "list"
}

variable "efs_sg_rule_ports_to_sg" {
  type = "list"
}

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
# Common variables #
####################

variable "aws_iam_instance_profile" {}
variable "key_name" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "infra_bastion_sg" {}

variable "tags_default" {
  type    = "map"
  default = {}
}

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

variable "efs_elb_names" {
  type = "list"
}

variable "cps_instance_ports" {
  type = "list"
}

variable "dns_zone_name" {}

//variable "cps_user_data" {}

##############
# ec2 jscape #
##############

variable "cps_jscape_ami_id" {}
variable "cps_jscape_instance_type" {}
variable "cps_jscape_instance_count" {}
variable "cps_jscape_instance_name" {}

variable "cps_jscape_private_ips" {
  type = "list"
}

//variable "cps_jscape_user_data" {}

###########
# efs elb #
###########

variable "efs_elb_name" {}
variable "efs_elb_internal" {}
variable "efs_elb_tag_name" {}
variable "cps_jscape_elb_port" {}
variable "cps_jscape_instance_port" {}

variable "internal" {
  default = "false"
}

variable "instance_protocol" {
  default = "http"
}

# variable "elb_port" {}

variable "elb_count" {
  default = 1
}

variable "lb_protocol" {
  default = "http"
}

variable "healthy_threshold" {
  default = 2
}

variable "unhealthy_threshold" {
  default = 5
}

variable "timeout" {
  default = 3
}

variable "interval" {
  default = 30
}

variable "cross_zone_load_balancing" {
  default = true
}

variable "idle_timeout" {
  default = 400
}

variable "connection_draining" {
  default = true
}

variable "connection_draining_timeout" {
  default = 400
}

variable "tag_name" {
  default = []
  type    = "list"
}
