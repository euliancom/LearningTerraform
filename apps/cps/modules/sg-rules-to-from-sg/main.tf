resource "aws_security_group_rule" "sg_rules_to_from_sg" {
  type                     = "${var.type}"
  count                    = "${length(var.ports)}"
  from_port                = "${element(var.ports, count.index)}"
  to_port                  = "${element(var.ports, count.index)}"
  protocol                 = "${var.protocol}"
  source_security_group_id = "${var.source_security_group_id}"
  security_group_id        = "${var.security_group_id}"
}
