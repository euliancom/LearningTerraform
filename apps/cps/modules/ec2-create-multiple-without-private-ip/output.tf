output "instance_id" {
  value = ["${aws_instance.ec2_create_multiple_with_private_ip.*.id}"]
}

output "instance_private_ip" {
  value = "${aws_instance.ec2_create_multiple_with_private_ip.*.private_ip}"
}

output "instance_az" {
  value = "${aws_instance.ec2_create_multiple_with_private_ip.*.availability_zone}"
}
