resource "aws_network_interface" "aws_eni" {
  subnet_id       = "${var.subnet_id}"
  private_ips     = ["${var.private_ips}"]
  security_groups = ["${compact(split(",", var.security_group_ids))}"]
}

resource "aws_instance" "ec2_create_multiple_with_private_ip" {
  ami                  = "${var.ami_id}"
  count                = "${var.instance_count}"
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${var.aws_iam_instance_profile}"

  key_name               = "${var.key_name}"
  
  tags = "${merge(
      var.tags_default,
      map(
         "Name", 
         "${var.name}",
         )
      )
  }"
  
  network_interface {
     network_interface_id = "${aws_network_interface.aws_eni.id}"
     device_index = 0
  }

  user_data = "${var.ec2_user_data}"
}
