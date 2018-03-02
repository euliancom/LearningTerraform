resource "aws_security_group" "sg_create" {
  name        = "${var.name}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(
      var.tags_default,
      map(
         "Name", 
         "${var.tag_name}",
         )
      )
  }"
}
