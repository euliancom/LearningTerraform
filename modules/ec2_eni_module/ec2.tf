resource "aws_instance" "ec2" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"

  tags {
    Name        = "${var.ec2_tag_name}"
  }

  user_data     = "${var.user_data}"
}
