# output cps_instsnce_id {
#   value = ["${aws_instance.ec2_create_multiple_without_private_ip.instance_id}"]
# }

# output cps_instance_private_ip {
#   value = "${aws_instance.ec2_create_multiple_without_private_ip.instance_private_ip}"
# }

# output cps_jscape_instsnce_id {
#   value = ["${aws_instance.cps_jscape_instsnce_id.instance_id}"]
# }

# output cps_jscape_instance_private_ip {
#   value = "${aws_instance.ec2_create_multiple_with_private_ip.instance_private_ip}"
# }

output "instance_id" {
  value = ["${aws_instance.ec2_create_multiple_with_private_ip.*.id}"]
}

output "instance_private_ip" {
  value = "${aws_instance.ec2_create_multiple_with_private_ip.*.private_ip}"
}

output "instance_id_wpi" {
  value = ["${aws_instance.ec2_create_multiple_without_private_ip.*.id}"]
}

output "instance_private_ip_wpi" {
  value = "${aws_instance.ec2_create_multiple_without_private_ip.*.private_ip}"
}

output "instance_az_wpi" {
  value = "${aws_instance.ec2_create_multiple_without_private_ip.*.availability_zone}"
}

output "efs_id" {
  value = "${aws_efs_file_system.efs_file_system.id}"
}

output "efs_dns_name" {
  value = "${aws_efs_mount_target.efs_mount_target.dns_name}"
}

output "sg_id" {
  value = "${aws_security_group.efs_aws_security_group.id}"
}
