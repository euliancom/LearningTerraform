resource "aws_network_interface" "eni" {
  subnet_id       = "${data.aws_subnet.public_a.id}"
  private_ips     = ["${var.eni_private_ips}"]
  security_groups = ["${data.aws_security_group.security_group.id}"]
}
