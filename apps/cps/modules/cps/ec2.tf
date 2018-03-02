###########
# cps ec2 #
###########

module "cps_ec2" {
  source = "../ec2-create-multiple-without-private-ip"

  ami_id                   = "${var.cps_ami_id}"
  instance_type            = "${var.cps_instance_type}"
  instance_count           = "${var.cps_instance_count}"
  name                     = "${var.cps_instance_name}"
  aws_iam_instance_profile = "${var.aws_iam_instance_profile}"
  subnet_id                = "${var.subnet_id}"
  key_name                 = "${var.key_name}"
  security_group_ids       = "sg-63961f19,sg-a61d34da,sg-1848c061,sg-4f4c5c37,sg-d55b79a9"  
  //security_group_ids       = "${var.infra_bastion_sg},${module.efs_aws_security_group.sg_id},${module.cps_aws_security_group.sg_id}"  
  ec2_user_data            = "${data.template_file.user_data_cps.rendered}"
  tags_default             = "${module.merge_tags_list.tags_default}"
}

##############
# cps jscape #
##############

module "cps_jscape" {
  source = "../ec2-create-multiple-with-private-ip"

  ami_id                   = "${var.cps_jscape_ami_id}"
  instance_type            = "${var.cps_jscape_instance_type}"
  instance_count           = "${var.cps_jscape_instance_count}"
  name                     = "${var.cps_jscape_instance_name}"
  aws_iam_instance_profile = "${var.aws_iam_instance_profile}"
  subnet_id                = "${var.subnet_id}"
  private_ips              = "${var.cps_jscape_private_ips}"
  key_name                 = "${var.key_name}"
  security_group_ids       = "sg-63961f19,sg-1848c061,sg-4f4c5c37,sg-d55b79a9"  
  //security_group_ids       = "${var.infra_bastion_sg},${module.efs_aws_security_group.sg_id},${module.cps_aws_security_group.sg_id}"  
  ec2_user_data            = "${data.template_file.user_data_cps_jscape.rendered}"
  tags_default             = "${module.merge_tags_list.tags_default}"
}
