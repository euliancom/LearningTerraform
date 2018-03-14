##########################
# cps aws security group #
##########################

resource "aws_security_group" "cps_aws_security_group" {
  name        = "${var.cps_sg_name}"
  description = "${var.cps_sg_description}"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(
      module.merge_tags_list.tags_default,
      map(
         "Name", 
         "${var.cps_sg_tag_name}",
         )
      )
  }"
}

#################################
# cps sg rules without cidr all #
#################################

resource "aws_security_group_rule" "cps_cps_sg_rules_without_cidr_all" {
  type              = "${var.sg_rule_type_ingress}"
  count             = "${length(var.cps_sg_rule_ports_all)}"
  from_port         = "${element(var.cps_sg_rule_ports_all, count.index)}"
  to_port           = "${element(var.cps_sg_rule_ports_all, count.index)}"
  protocol          = "${var.sg_rule_protocol_all}"
  self              = "${var.sg_rule_self}"
  security_group_id = "${aws_security_group.cps_aws_security_group.id}"
}

#################################
# cps sg rules without cidr tcp #
#################################

resource "aws_security_group_rule" "cps_cps_sg_rules_without_cidr_tcp" {
  type              = "${var.sg_rule_type_ingress}"
  count             = "${length(var.cps_sg_rule_ports_tcp)}"
  from_port         = "${element(var.cps_sg_rule_ports_tcp, count.index)}"
  to_port           = "${element(var.cps_sg_rule_ports_tcp, count.index)}"
  protocol          = "${var.sg_rule_protocol_tcp}"
  self              = "${var.sg_rule_self}"
  security_group_id = "${aws_security_group.cps_aws_security_group.sg_id}"
}

##############################
# cps sg rules with cidr all #
##############################

resource "aws_security_group_rule" "cps_cps_sg_rules_with_cidr_all" {
  type              = "${var.sg_rule_type_egress}"
  count             = "${length(var.cps_sg_rule_ports_to_cidr_all)}"
  from_port         = "${element(var.cps_sg_rule_ports_to_cidr_all, count.index)}"
  to_port           = "${element(var.cps_sg_rule_ports_to_cidr_all, count.index)}"
  protocol          = "${var.sg_rule_protocol_all}"
  cidr_blocks       = ["${var.sg_cidr_blocks}"]
  security_group_id = "${aws_security_group.cps_aws_security_group.sg_id}"
}

##############################
# cps sg rules with cidr tcp #
##############################

resource "aws_security_group_rule" "cps_cps_sg_rules_with_cidr_tcp" {
  type              = "${var.sg_rule_type_ingress}"
  count             = "${length(var.cps_sg_rule_ports_to_cidr_tcp)}"
  from_port         = "${element(var.cps_sg_rule_ports_to_cidr_tcp, count.index)}"
  to_port           = "${element(var.cps_sg_rule_ports_to_cidr_tcp, count.index)}"
  protocol          = "${var.sg_rule_protocol_tcp}"
  cidr_blocks       = ["${var.sg_cidr_blocks}"]
  security_group_id = "${aws_security_group.cps_aws_security_group.sg_id}"
}

##########################
# efs aws security group #
##########################

resource "aws_security_group" "efs_aws_security_group" {
  name        = "${var.efs_sg_name}"
  description = "${var.efs_sg_description}"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(
      module.merge_tags_list.tags_default,
      map(
         "Name", 
         "${var.efs_sg_tag_name}",
         )
      )
  }"
}

#################################
# efs sg rules without cidr tcp #
#################################

resource "aws_security_group_rule" "efs_cps_sg_rules_without_cidr_tcp" {
  type              = "${var.sg_rule_type_ingress}"
  count             = "${length(var.efs_sg_rule_ports_tcp)}"
  from_port         = "${element(var.efs_sg_rule_ports_tcp, count.index)}"
  to_port           = "${element(var.efs_sg_rule_ports_tcp, count.index)}"
  protocol          = "${var.sg_rule_protocol_tcp}"
  self              = "${var.sg_rule_self}"
  security_group_id = "${aws_security_group.efs_aws_security_group.sg_id}"
}

##############################
# efs sg rules with cidr all #
##############################

resource "aws_security_group_rule" "efs_cps_sg_rules_with_cidr_all" {
  type              = "${var.sg_rule_type_egress}"
  count             = "${length(var.efs_sg_rule_ports_to_cidr_all)}"
  from_port         = "${element(var.efs_sg_rule_ports_to_cidr_all, count.index)}"
  to_port           = "${element(var.efs_sg_rule_ports_to_cidr_all, count.index)}"
  protocol          = "${var.sg_rule_protocol_all}"
  cidr_blocks       = ["${var.sg_cidr_blocks}"]
  security_group_id = "${aws_security_group.efs_aws_security_group.sg_id}"
}

###########################
# efs sg rules to/from sg #
###########################

resource "aws_security_group_rule" "efs_cps_sg_rules_to_from_sg" {
  type                     = "${var.sg_rule_type_ingress}"
  count                    = "${length(var.efs_sg_rule_ports_to_sg)}"
  from_port                = "${element(var.efs_sg_rule_ports_to_sg, count.index)}"
  to_port                  = "${element(var.efs_sg_rule_ports_to_sg, count.index)}"
  protocol                 = "${var.sg_rule_protocol_all}"
  source_security_group_id = "${aws_security_group.cps_aws_security_group.sg_id}"
  security_group_id        = "${aws_security_group.efs_aws_security_group.sg_id}"
}
