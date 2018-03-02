resource "aws_efs_mount_target" "efs_mount_target" {
  file_system_id  = "${var.file_system_id}"
  subnet_id       = "${var.subnet_id}"
  security_groups = ["${var.security_groups}"]
}
