resource "aws_instance" "ec2_create_multiple_with_private_ip" {
  ami                  = "${var.ami_id}"
  count                = "${var.instance_count}"
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${var.aws_iam_instance_profile}"

  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${compact(split(",", var.security_group_ids))}"]
  key_name               = "${var.key_name}"
  
  tags = "${merge(
      var.tags_default,
      map(
         "Name", 
         "${var.name}",
         )
      )
  }"

  user_data = "${var.ec2_user_data}"
}
