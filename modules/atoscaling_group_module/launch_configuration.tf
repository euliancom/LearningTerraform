
resource "aws_launch_configuration" "as_conf" {
  name          = "${var.launch_config_name}"
  image_id      = "${var.image_id}"
  instance_type = "${var.instance_type}"
}