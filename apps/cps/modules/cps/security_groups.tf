##########################
# cps aws security group #
##########################

module "cps_aws_security_group" {
  source = "../sg-create"

  name         = "${var.cps_sg_name}"
  description  = "${var.cps_sg_description}"
  vpc_id       = "${var.vpc_id}"
  tag_name     = "${var.cps_sg_tag_name}"
  tags_default = "${module.merge_tags_list.tags_default}"
}

#################################
# cps sg rules without cidr all #
#################################

module "cps_cps_sg_rules_without_cidr_all" {
  source = "../sg-rules-without-cidr"

  type              = "${var.sg_rule_type_ingress}"
  ports             = "${var.cps_sg_rule_ports_all}"
  protocol          = "${var.sg_rule_protocol_all}"
  sg_self           = "${var.sg_rule_self}"
  security_group_id = "${module.cps_aws_security_group.sg_id}"
}

#################################
# cps sg rules without cidr tcp #
#################################

module "cps_cps_sg_rules_without_cidr_tcp" {
  source = "../sg-rules-without-cidr"

  type              = "${var.sg_rule_type_ingress}"
  ports             = "${var.cps_sg_rule_ports_tcp}"
  protocol          = "${var.sg_rule_protocol_tcp}"
  sg_self           = "${var.sg_rule_self}"
  security_group_id = "${module.cps_aws_security_group.sg_id}"
}

##############################
# cps sg rules with cidr all #
##############################

module "cps_cps_sg_rules_with_cidr_all" {
  source = "../sg-rules-with-cidr"

  type              = "${var.sg_rule_type_egress}"
  ports             = "${var.cps_sg_rule_ports_to_cidr_all}"
  protocol          = "${var.sg_rule_protocol_all}"
  sg_cidr_blocks    = "${var.sg_cidr_blocks}"
  security_group_id = "${module.cps_aws_security_group.sg_id}"
}

##############################
# cps sg rules with cidr tcp #
##############################

module "cps_cps_sg_rules_with_cidr_tcp" {
  source = "../sg-rules-with-cidr"

  type              = "${var.sg_rule_type_ingress}"
  ports             = "${var.cps_sg_rule_ports_to_cidr_tcp}"
  protocol          = "${var.sg_rule_protocol_tcp}"
  sg_cidr_blocks    = "${var.sg_cidr_blocks}"
  security_group_id = "${module.cps_aws_security_group.sg_id}"
}

##########################
# efs aws security group #
##########################

module "efs_aws_security_group" {
  source = "../sg-create"

  name        = "${var.efs_sg_name}"
  description = "${var.efs_sg_description}"
  vpc_id      = "${var.vpc_id}"
  tag_name    = "${var.efs_sg_tag_name}"
  tags_default = "${module.merge_tags_list.tags_default}"
}

#################################
# efs sg rules without cidr tcp #
#################################

module "efs_cps_sg_rules_without_cidr_tcp" {
  source = "../sg-rules-without-cidr"

  type              = "${var.sg_rule_type_ingress}"
  ports             = "${var.efs_sg_rule_ports_tcp}"
  protocol          = "${var.sg_rule_protocol_tcp}"
  sg_self           = "${var.sg_rule_self}"
  security_group_id = "${module.efs_aws_security_group.sg_id}"
}

##############################
# efs sg rules with cidr all #
##############################

module "efs_cps_sg_rules_with_cidr_all" {
  source = "../sg-rules-with-cidr"

  type              = "${var.sg_rule_type_egress}"
  ports             = "${var.efs_sg_rule_ports_to_cidr_all}"
  protocol          = "${var.sg_rule_protocol_all}"
  sg_cidr_blocks    = "${var.sg_cidr_blocks}"
  security_group_id = "${module.efs_aws_security_group.sg_id}"
}

###########################
# efs sg rules to/from sg #
###########################

module "efs_cps_sg_rules_to_from_sg" {
  source = "../sg-rules-to-from-sg"

  type                     = "${var.sg_rule_type_ingress}"
  ports                    = "${var.efs_sg_rule_ports_to_sg}"
  protocol                 = "${var.sg_rule_protocol_all}"
  source_security_group_id = "${module.cps_aws_security_group.sg_id}"
  security_group_id        = "${module.efs_aws_security_group.sg_id}"
}