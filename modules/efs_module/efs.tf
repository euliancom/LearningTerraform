resource "aws_efs_file_system" "efs" {
  creation_token = "${var.creation_token}"

  tags {
    Name = "${var.efs_tag_name}"
  }
}

resource "aws_efs_mount_target" "mount_target" {
  file_system_id = "${aws_efs_file_system.efs.id}"
  subnet_id      = "${var.subnet_id}"
}
