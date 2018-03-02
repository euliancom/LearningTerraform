module "cps" {
  source = "./modules/cps"

  env = "${var.env}"
  
  ######################
  # CPS security group #
  ######################

  cps_sg_name        = "${var.cps_sg_name}"
  cps_sg_description = "${var.cps_sg_description}"
  cps_sg_tag_name    = "${var.cps_sg_tag_name}"

  ############################
  # CPS security group rules #
  ############################

  cps_sg_rule_ports_tcp         = "${split(",",var.cps_sg_rule_ports_tcp)}"
  cps_sg_rule_ports_all         = "${split(",",var.cps_sg_rule_ports_all)}"
  cps_sg_rule_ports_to_cidr_tcp = "${split(",",var.cps_sg_rule_ports_to_cidr_tcp)}"
  cps_sg_rule_ports_to_cidr_all = "${split(",",var.cps_sg_rule_ports_to_cidr_all)}"

  ######################
  # EFS security group #
  ######################

  efs_sg_name        = "${var.efs_sg_name}"
  efs_sg_description = "${var.efs_sg_description}"
  efs_sg_tag_name    = "${var.efs_sg_tag_name}"

  ############################
  # EFS security group rules #
  ############################

  efs_sg_rule_ports_tcp         = "${split(",",var.efs_sg_rule_ports_tcp)}"
  efs_sg_rule_ports_to_cidr_all = "${split(",",var.efs_sg_rule_ports_to_cidr_all)}"
  efs_sg_rule_ports_to_sg       = "${split(",",var.efs_sg_rule_ports_to_sg)}"

  #######################
  # CPS efs file system #
  #######################

  cps_efs_file_system_creation_token = "${var.cps_efs_file_system_creation_token}"
  cps_efs_file_system_name           = "${var.cps_efs_file_system_name}"

  ###############################
  # CPS efs file system nondata #
  ###############################

  nondata_efs_file_system_creation_token = "${var.nondata_efs_file_system_creation_token}"
  nondata_efs_file_system_name           = "${var.nondata_efs_file_system_name}"

  ####################
  # common variables #
  ####################

  aws_iam_instance_profile = "${var.aws_iam_instance_profile}"
  key_name                 = "${var.key_name}"
  vpc_id                   = "${var.vpc_id}"
  subnet_id                = "${var.subnet_id}"
  infra_bastion_sg         = "${var.infra_bastion_sg}"

  ###########
  # ec2 cps #
  ###########

  cps_ami_id         = "${var.cps_ami_id}"
  cps_ag_ami_id      = "${var.cps_ag_ami_id}"
  cps_instance_type  = "${var.cps_instance_type}"
  cps_instance_count = "${var.cps_instance_count}"
  cps_instance_name  = "${var.cps_instance_name}"

  ###########
  # efs elb #
  ###########

  dns_zone_name      = "${var.dns_zone_name}"
  cps_elb_count      = "${var.cps_elb_count}"
  efs_elb_names      = "${split(",",var.efs_elb_names)}"
  cps_instance_ports = "${split(",",var.cps_instance_ports)}"

  ##############
  # ec2 jscape #
  ##############

  cps_jscape_ami_id         = "${var.cps_jscape_ami_id}"
  cps_jscape_instance_type  = "${var.cps_jscape_instance_type}"
  cps_jscape_instance_count = "${var.cps_jscape_instance_count}"
  cps_jscape_instance_name  = "${var.cps_jscape_instance_name}"
  cps_jscape_private_ips    = "${split(",",var.cps_jscape_private_ips)}"

  ###########
  # efs elb #
  ###########

  efs_elb_name             = "${var.efs_elb_name}"
  efs_elb_internal         = "${var.efs_elb_internal}"
  efs_elb_tag_name         = "${var.efs_elb_tag_name}"
  cps_jscape_elb_port      = "${var.cps_jscape_elb_port}"
  cps_jscape_instance_port = "${var.cps_jscape_instance_port}"
}
