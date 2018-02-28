module "ec2_eni_module" {
  source = "../../modules/ec2_eni_module"

  user_data = ""
  subnet_id              = "${var.subnet_id}"
  eni_private_ips        = "${var.eni_private_ips}"
  instance_type          = "${var.instance_type}"
  vpc_tag_name           = "${var.vpc_tag_name}"
  ec2_tag_name           = "${var.ec2_tag_name}"
  key_name               = "${var.key_name}"
  instance_ami           = "${var.instance_ami}"
  group_name             = "${var.group_name}"
}

module "elb_module" {
  source = "../../modules/elb_module"

  elb_name               = "${var.elb_name}"
  elb_availability_zones = "${var.elb_availability_zones}"
  elb_tag_name           = "${var.elb_tag_name}"
  aws_instance_id        = "${module.ec2_eni_module.ec2_id}"
  subnet_ids             = ["${var.subnet_ids}"]
  security_groups        = ["${var.security_groups}"]
}

module "route_53_module" {
  source = "../../modules/route_53_module"

  route53_record_name = "${var.route53_record_name}"
  route53_record_type = "${var.route53_record_type}"
  elb_dns_name        = "${module.elb_module.elb_dns_name}"
  elb_zone_id         = "${module.elb_module.elb_zone_id}"
  route53_zone_name   = "${var.route53_zone_name}"
}