module "ec2_eni_module" {
  source = "../../modules/ec2_eni_module"

  user_data       = ""
  subnet_id       = "${var.subnet_id}"
  eni_private_ips = "${var.eni_private_ips}"
  instance_type   = "${var.instance_type}"
  vpc_tag_name    = "${var.vpc_tag_name}"
  ec2_tag_name    = "${var.ec2_tag_name}"
  key_name        = "${var.key_name}"
  instance_ami    = "${var.instance_ami}"
  group_name      = "${var.group_name}"
}

module "elb_module" {
  source = "../../modules/elb_module"

  elb_name               = "${var.elb_name}"
  elb_availability_zones = "${var.elb_availability_zones}"
  elb_tag_name           = "${var.elb_tag_name}"
  aws_instance_id        = "${module.ec2_eni_module.ec2_id}"
  subnet_id              = "${var.subnet_id}"
  group_name             = "${module.ec2_eni_module.security_group_id}"
}

module "autoscaling_module" {
  source = "../../modules/atoscaling_group_module"

  min_size                  = "${var.min_size}"
  max_size                  = "${var.max_size}"
  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type         = "${var.health_check_type}"
  load_balancers            = "${module.elb_module.elb_id}"
  launch_config_name        = "${var.launch_config_name}"
  image_id                  = "${var.instance_ami}"
  instance_type             = "${var.instance_type}"
  availability_zones        = "${var.elb_availability_zones}"
}
