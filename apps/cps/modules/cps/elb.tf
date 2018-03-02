###############
# cps aws elb #
###############

module "cps_aws_elb" {
  source = "../elb-create"
  env             = "${var.env}"
  elb_count       = "${var.cps_elb_count}"
  name            = "${var.efs_elb_names}"
  internal        = "${var.efs_elb_internal}"
  subnet_ids      = ["${var.subnet_id}"]
  security_groups = ["sg-63961f19","sg-a61d34da","sg-1848c061","sg-4f4c5c37","sg-d55b79a9"]  
  //security_groups = ["${var.infra_bastion_sg}", "${module.efs_aws_security_group.sg_id}", "${module.cps_aws_security_group.sg_id}"]
  instance_ports  = "${var.cps_instance_ports}"
  elb_port        = 80
  instance_id     = ["${module.cps_ec2.instance_id}"]
  tag_name        = "${var.efs_elb_names}"
  tags_default    = "${module.merge_tags_list.tags_default}"
}

##########################
# cps aws route53 apache #
##########################

module "cps_aws_elb_apache" {
  source = "../elb-create"
  env             = "${var.env}"
  elb_count       = 1
  name            = ["cats-engine"]
  internal        = "${var.efs_elb_internal}"
  subnet_ids      = ["${var.subnet_id}"]
  security_groups = ["sg-63961f19","sg-a61d34da","sg-1848c061","sg-4f4c5c37","sg-d55b79a9"]  
  //security_groups = ["${var.infra_bastion_sg}", "${module.efs_aws_security_group.sg_id}", "${module.cps_aws_security_group.sg_id}"]
  instance_ports  = [9595]
  elb_port        = 80
  instance_id     = ["${module.cps_ec2.instance_id}"]
  tag_name        = ["cats-engine"]
  tags_default    = "${module.merge_tags_list.tags_default}"
}

##############
# cps Jscape #
##############

module "cps_aws_elb_jscape" {
  source = "../elb-create"
  env             = "${var.env}"
  elb_count       = 1
  name            = ["jscape"]
  internal        = "${var.efs_elb_internal}"
  subnet_ids      = ["${var.subnet_id}"]
  security_groups = ["sg-63961f19","sg-a61d34da","sg-1848c061","sg-4f4c5c37","sg-d55b79a9"]  
  //security_groups = ["${var.infra_bastion_sg}", "${module.efs_aws_security_group.sg_id}", "${module.cps_aws_security_group.sg_id}"]
  instance_ports  = [8521]
  elb_port        = 80
  instance_id     = ["${module.cps_jscape.instance_id}"]
  tag_name        = ["jscape"]
  tags_default    = "${module.merge_tags_list.tags_default}"
}

######################
# cps jscape aws elb #
######################

resource "aws_elb" "cps_jscape_aws_elb_server" {
  name     = "${var.efs_elb_name}-${var.env}"
  internal = "${var.efs_elb_internal}"
  count    = 1
  subnets         = ["${var.subnet_id}"]
  security_groups = ["sg-63961f19","sg-1848c061","sg-4f4c5c37","sg-d55b79a9"]
  //security_groups = ["${var.infra_bastion_sg}", "${module.efs_aws_security_group.sg_id}", "${module.cps_aws_security_group.sg_id}","sg-63961f19"]
  
  listener {
    instance_port     = 11880
    instance_protocol = "http"
    lb_port           = 11880
    lb_protocol       = "http"
  }

  listener {
    instance_port     = 11880
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 3
    target              = "TCP:11880"
    interval            = 30
  }

  instances                   = ["${module.cps_jscape.instance_id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = "${merge(
      module.merge_tags_list.tags_default,
      map(
         "Name", 
         "${var.efs_elb_tag_name}-${var.env}",
         )
      )
  }"
}