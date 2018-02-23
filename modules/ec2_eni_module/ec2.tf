resource "aws_instance" "ec2" {
  ami                     = "${var.instance_ami}"
  instance_type           = "${var.instance_type}"
  key_name                = "${var.key_name}"

  tags {
    Name                  = "${var.ec2_tag_name}"
  }

  network_interface {
     network_interface_id = "${aws_network_interface.eni.id}"
     device_index         = 0
    } 

  user_data               = "${var.user_data}"
}
