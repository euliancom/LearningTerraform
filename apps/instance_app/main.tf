module "child"{
  source    = "../../modules/ec2_eni_module"

  user_data = "${data.template_file.user_data.rendered}"

  subnet_id       = "${var.subnet_id}"
  eni_private_ips = "${var.eni_private_ips}"
  instance_type   = "${var.instance_type}"
  vpc_tag_name    = "${var.vpc_tag_name}"
  ec2_tag_name    = "${var.ec2_tag_name}"
  key_name        = "${var.key_name}"
  instance_ami    = "${var.instance_ami}"
  group_name      = "${var.group_name}"
}
