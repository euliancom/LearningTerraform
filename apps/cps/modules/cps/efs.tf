#######################
# cps efs file system #
#######################
resource "aws_efs_file_system" "efs_file_system" {
  creation_token = "${var.cps_efs_file_system_creation_token}"

  tags = "${merge(
      module.merge_tags_list.tags_default,
      map(
         "Name", 
         "${var.cps_efs_file_system_name}",
         )
      )
  }"
}

############################
# cps aws efs mount target #
############################

resource "aws_efs_mount_target" "efs_mount_target" {
  file_system_id  = "${aws_efs_file_system.efs_file_system.id}"
  subnet_id       = "${var.subnet_id}"
  security_groups = ["${aws_security_group.efs_aws_security_group.sg_id}"]
}

###############################
# cps efs file system nondata #
###############################

resource "aws_efs_file_system" "nondata_efs_file_system" {
  creation_token = "${var.nondata_efs_file_system_creation_token}"

  tags = "${merge(
      module.merge_tags_list.tags_default,
      map(
         "Name", 
         "${var.nondata_efs_file_system_name}",
         )
      )
  }"
}

####################################
# cps aws efs mount target nondata #
####################################

resource "aws_efs_mount_target" "nondata_aws_efs_mount_target" {
  file_system_id  = "${aws_efs_file_system.nondata_efs_file_system.id}"
  subnet_id       = "${var.subnet_id}"
  security_groups = ["${aws_security_group.efs_aws_security_group.sg_id}"]
}
