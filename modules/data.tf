data "aws_subnet" "public_a" {
  vpc_id = "${data.aws_vpc.selected.id}"
  id     = "${var.subnet_id}"
}

data "aws_vpc" "selected" {
 tags {
   Name = "${vpc_tag_name}"
 }
}

data "aws_security_group" "security_group" {
  vpc_id = "${data.aws_vpc.selected.id}"

  filter {
    name   = "group-name"
    values = ["${vpc_tag_name}"]
  }
} 