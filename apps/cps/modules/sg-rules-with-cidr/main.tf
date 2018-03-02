resource "aws_security_group_rule" "sg_rules_with_cidr" {
  type              = "${var.type}"
  count             = "${length(var.ports)}"
  from_port         = "${element(var.ports, count.index)}"
  to_port           = "${element(var.ports, count.index)}"
  protocol          = "${var.protocol}"
  cidr_blocks       = ["${var.sg_cidr_blocks}"]
  security_group_id = "${var.security_group_id}"
}
