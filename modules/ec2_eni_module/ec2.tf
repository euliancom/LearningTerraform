resource "aws_instance" "ec2" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"

  user_data = "${var.user_data}"
}
