resource "aws_autoscaling_group" "bar" {
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"
  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type         = "${var.health_check_type}"
  launch_configuration      = "${aws_launch_configuration.as_conf.name}"
  load_balancers            = ["${var.load_balancers}"]
  availability_zones        = "${var.availability_zones}"

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }
}
