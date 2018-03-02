output "efs_dns_name" {
  value = "${aws_efs_mount_target.efs_mount_target.dns_name}"
}
