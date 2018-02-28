data "aws_vpc" "selected" {
 tags {
   Name    = "${var.vpc_tag_name}"
 }
}

data "aws_security_group" "SG-1" {
  vpc_id   = "${data.aws_vpc.selected.id}"

  filter {
    name   = "group-name"
    values = ["${var.SG1group_name}"]
  }
}

data "aws_security_group" "SG-2" {
  vpc_id   = "${data.aws_vpc.selected.id}"

  filter {
    name   = "group-name"
    values = ["${var.SG2group_name}"]
  }
}

data "aws_security_group" "SG-3" {
  vpc_id   = "${data.aws_vpc.selected.id}"

  filter {
    name   = "group-name"
    values = ["${var.SG3group_name}"]
  }
}

data "aws_security_group" "SG-4" {
  vpc_id   = "${data.aws_vpc.selected.id}"

  filter {
    name   = "group-name"
    values = ["${var.SG4group_name}"]
  }
}