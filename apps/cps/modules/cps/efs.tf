#######################
# cps efs file system #
#######################

module "cps_efs_file_system" {
  source = "../efs-file-system"

  creation_token = "${var.cps_efs_file_system_creation_token}"
  name           = "${var.cps_efs_file_system_name}"
  tags_default   = "${module.merge_tags_list.tags_default}"
}

############################
# cps aws efs mount target #
############################

module "cps_aws_efs_mount_target" {
  source = "../efs-mount-target"

  file_system_id  = "${module.cps_efs_file_system.id}"
  subnet_id       = "${var.subnet_id}"
  security_groups = ["${module.efs_aws_security_group.sg_id}"]
}

###############################
# cps efs file system nondata #
###############################

module "nondata_efs_file_system" {
  source = "../efs-file-system"

  creation_token = "${var.nondata_efs_file_system_creation_token}"
  name           = "${var.nondata_efs_file_system_name}"
  tags_default   = "${module.merge_tags_list.tags_default}"
}

####################################
# cps aws efs mount target nondata #
####################################

module "nondata_aws_efs_mount_target" {
  source = "../efs-mount-target"

  file_system_id  = "${module.nondata_efs_file_system.id}"
  subnet_id       = "${var.subnet_id}"
  security_groups = ["${module.efs_aws_security_group.sg_id}"]
}