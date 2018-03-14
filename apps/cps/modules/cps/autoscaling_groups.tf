resource "aws_launch_configuration" "aws_lc" {
  name_prefix          = "cps-launch-configuration-${var.env}"
  image_id             = "${var.cps_ag_ami_id}"
  instance_type        = "${var.cps_instance_type}"
  iam_instance_profile = "${var.aws_iam_instance_profile}"
  security_groups      = ["sg-63961f19", "sg-a61d34da", "sg-1848c061", "sg-4f4c5c37", "sg-d55b79a9"]

  //security_groups            = ["${var.infra_bastion_sg}","${module.efs_aws_security_group.sg_id}","${module.cps_aws_security_group.sg_id}","sg-63961f19" ]
  key_name                    = "${var.key_name}"
  associate_public_ip_address = true
  user_data                   = "${data.template_file.user_data_cps.rendered}"
}

resource "aws_autoscaling_group" "asg-dev" {
  name                 = "cps-autoscaling-group-${var.env}"
  launch_configuration = "${aws_launch_configuration.aws_lc.name}"
  vpc_zone_identifier  = ["${var.subnet_id}"]
  availability_zones   = ["${aws_instance.ec2_create_multiple_without_private_ip.instance_az}"]
  max_size             = 1
  min_size             = 1
  desired_capacity     = 1
  health_check_type    = "ELB"
  load_balancers       = ["${concat(aws_elb.cps_aws_elb.elb_name, aws_elb.cps_aws_elb_apache.elb_name)}"]

  tags = ["${concat(
    list(
      map("key", "Name", "value", "WOSCPS-snapshot-asg-TF", "propagate_at_launch", true)
    ),
    module.merge_tags_list.tags_merged_asg)
  }"]
}
