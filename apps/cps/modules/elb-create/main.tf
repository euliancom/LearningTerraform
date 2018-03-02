resource "aws_elb" "elb_create" {
  name     = "${element(var.name,count.index)}-${var.env}"
  internal = "${var.internal}"
  count    = "${var.elb_count}"
  subnets         = ["${var.subnet_ids}"]
  security_groups = ["${var.security_groups}"]

  listener {
    instance_port     = "${element(var.instance_ports,count.index)}"
    instance_protocol = "${var.instance_protocol}"
    lb_port           = "${var.elb_port}"
    lb_protocol       = "${var.lb_protocol}"
  }

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.timeout}"
    target              = "TCP:${element(var.instance_ports,count.index)}"
    interval            = "${var.interval}"
  }

  instances                   = ["${var.instance_id}"]
  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  tags = "${merge(
      var.tags_default,
      map(
         "Name", 
         "${element(var.tag_name,count.index)}-${var.env}",
         )
      )
  }"
}
