###########
# cps ec2 #
###########

resource "aws_instance" "ec2_create_multiple_without_private_ip" {
  ami                  = "${var.cps_ami_id}"
  count                = "${var.cps_instance_count}"
  instance_type        = "${var.cps_instance_type}"
  iam_instance_profile = "${var.aws_iam_instance_profile}"

  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["sg-63961f19","sg-a61d34da","sg-1848c061","sg-4f4c5c37","sg-d55b79a9"]
  key_name               = "${var.key_name}"
  
  tags = "${merge(
      module.merge_tags_list.tags_default,
      map(
         "Name", 
         "${var.cps_instance_name}",
         )
      )
  }"

  user_data = "${data.template_file.user_data_cps.rendered}"
}

resource "aws_network_interface" "aws_eni" {
  subnet_id       = "${var.subnet_id}"
  private_ips     = ["${var.cps_jscape_private_ips}"]
  security_groups = ["sg-63961f19","sg-1848c061","sg-4f4c5c37","sg-d55b79a9"]
}

resource "aws_instance" "ec2_create_multiple_with_private_ip" {
  ami                  = "${var.cps_jscape_ami_id}"
  count                = "${var.cps_jscape_instance_count}"
  instance_type        = "${var.cps_jscape_instance_type}"
  iam_instance_profile = "${var.aws_iam_instance_profile}"

  key_name               = "${var.key_name}"
  
  tags = "${merge(
      module.merge_tags_list.tags_default,
      map(
         "Name", 
         "${var.cps_jscape_instance_name}",
         )
      )
  }"
  
  network_interface {
     network_interface_id = "${aws_network_interface.aws_eni.id}"
     device_index = 0
  }

  user_data = "${data.template_file.user_data_cps_jscape.rendered}"
}
