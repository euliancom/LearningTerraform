###############
# cps aws elb #
###############

resource "aws_elb" "cps_aws_elb" {
  name            = "${element(var.efs_elb_names,count.index)}-${var.env}"
  internal        = "${var.efs_elb_internal}"
  count           = "${var.cps_elb_count}"
  subnets         = ["${var.subnet_id}"]
  security_groups = ["sg-63961f19", "sg-a61d34da", "sg-1848c061", "sg-4f4c5c37", "sg-d55b79a9"]

  listener {
    instance_port     = "${element(var.cps_instance_ports,count.index)}"
    instance_protocol = "${var.instance_protocol}"
    lb_port           = 80
    lb_protocol       = "${var.lb_protocol}"
  }

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.timeout}"
    target              = "TCP:${element(var.cps_instance_ports,count.index)}"
    interval            = "${var.interval}"
  }

  instances                   = ["${aws_instance.ec2_create_multiple_without_private_ip.instance_id}"]
  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  tags = "${merge(
      module.merge_tags_list.tags_default,
      map(
         "Name", 
         "${element(var.efs_elb_names,count.index)}-${var.env}",
         )
      )
  }"
}

##########################
# cps aws route53 apache #
##########################

resource "aws_elb" "cps_aws_elb_apache" {
  name            = "cats-engine-${var.env}"
  internal        = "${var.efs_elb_internal}"
  count           = 1
  subnets         = ["${var.subnet_id}"]
  security_groups = ["sg-63961f19", "sg-a61d34da", "sg-1848c061", "sg-4f4c5c37", "sg-d55b79a9"]

  listener {
    instance_port     = [9595]
    instance_protocol = "${var.instance_protocol}"
    lb_port           = 80
    lb_protocol       = "${var.lb_protocol}"
  }

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.timeout}"
    target              = "TCP:9595"
    interval            = "${var.interval}"
  }

  instances                   = ["${aws_instance.ec2_create_multiple_without_private_ip.instance_id}"]
  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  tags = "${merge(
      module.merge_tags_list.tags_default,
      map(
         "Name", 
         "cats-engine-${var.env}",
         )
      )
  }"
}

##############
# cps Jscape #
##############

resource "aws_elb" "cps_aws_elb_jscape" {
  name            = "jscape-${var.env}"
  internal        = "${var.efs_elb_internal}"
  count           = 1
  subnets         = ["${var.subnet_id}"]
  security_groups = ["sg-63961f19", "sg-a61d34da", "sg-1848c061", "sg-4f4c5c37", "sg-d55b79a9"]

  listener {
    instance_port     = [8521]
    instance_protocol = "${var.instance_protocol}"
    lb_port           = 80
    lb_protocol       = "${var.lb_protocol}"
  }

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.timeout}"
    target              = "TCP:8521"
    interval            = "${var.interval}"
  }

  instances                   = ["${aws_instance.ec2_create_multiple_with_private_ip.instance_id}"]
  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  tags = "${merge(
      module.merge_tags_list.tags_default,
      map(
         "Name", 
         "jscape-${var.env}",
         )
      )
  }"
}

######################
# cps jscape aws elb #
######################

resource "aws_elb" "cps_jscape_aws_elb_server" {
  name            = "${var.efs_elb_name}-${var.env}"
  internal        = "${var.efs_elb_internal}"
  count           = 1
  subnets         = ["${var.subnet_id}"]
  security_groups = ["sg-63961f19", "sg-1848c061", "sg-4f4c5c37", "sg-d55b79a9"]

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
  instances                   = ["${aws_instance.ec2_create_multiple_with_private_ip.instance_id}"]
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
