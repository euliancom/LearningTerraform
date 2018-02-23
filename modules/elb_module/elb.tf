resource "aws_elb" "load_balancer" {
  name            = "${var.elb_name}"
  subnets         = ["${var.subnet_ids}"]
  security_groups = ["${var.security_groups}"]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances                   = ["${var.aws_instance_id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "${var.elb_tag_name}"
  }
}