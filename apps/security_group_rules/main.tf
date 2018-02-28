resource "aws_security_group_rule" "SG1R1" {
  type        = "ingress"
  from_port   = 3389
  to_port     = 3389
  protocol    = "TCP"
  cidr_blocks = [
    "113.193.224.6/32",
    "114.143.216.139/32",
    "115.160.255.18/32",
    "202.83.18.212/32",
    "182.74.227.254/32",
    "198.179.137.204/32",
    "69.114.96.158/32",
    "49.248.111.50/32"]
  security_group_id = "${data.aws_security_group.SG-1.id}"
}

resource "aws_security_group_rule" "SG1R2" {
  type        = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${data.aws_security_group.SG-1.id}"
}

resource "aws_security_group_rule" "SG2R1" {
  type        = "ingress"
  from_port   = 8080
  to_port     = 8080
  protocol    = "TCP"
  cidr_blocks = [
    "111.93.146.246/32",
    "113.193.224.6/32",
    "114.143.216.139/32",
    "23.24.121.145/32",
    "23.24.121.146/32",
    "23.24.121.147/32",
    "23.24.121.148/32",
    "23.24.121.149/32",
    "23.24.121.150/32",
    "122.166.61.190/32",
    "202.83.18.212/32",
    "182.74.227.254/32",
    "115.160.255.18/32",
    "104.211.228.135/32",
    "49.248.111.50/32"]
  security_group_id = "${data.aws_security_group.SG-2.id}"
}

resource "aws_security_group_rule" "SG2R2" {
  type        = "ingress"
  from_port   = 1414
  to_port     = 1414
  protocol    = "TCP"
  cidr_blocks = [
    "111.93.146.246/32",
    "113.193.224.6/32",
    "114.143.216.139/32",
    "23.24.121.145/32",
    "23.24.121.146/32",
    "23.24.121.147/32",
    "23.24.121.148/32",
    "23.24.121.149/32",
    "23.24.121.150/32",
    "122.166.61.190/32",
    "202.83.18.212/32",
    "182.74.227.254/32",
    "115.160.255.18/32",
    "104.211.228.135/32",
    "49.248.111.50/32"]
  security_group_id = "${data.aws_security_group.SG-2.id}"
}

resource "aws_security_group_rule" "SG2R3" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "TCP"
  cidr_blocks = [
    "23.24.121.145/32",
    "23.24.121.146/32",
    "23.24.121.147/32",
    "23.24.121.148/32",
    "23.24.121.149/32",
    "23.24.121.150/32",
    "111.93.146.246/32",
    "122.166.61.190/32",
    "202.83.18.212/32",
    "182.74.227.254/32",
    "115.160.255.18/32",
    "113.193.224.6/32",
    "114.143.216.139/32",
    "104.211.228.135/32",
    "13.71.126.6/32",
    "49.248.111.50/32"]
  security_group_id = "${data.aws_security_group.SG-2.id}"
}

resource "aws_security_group_rule" "SG2R4" {
  type        = "ingress"
  from_port   = 515
  to_port     = 515 
  protocol    = "TCP"
  cidr_blocks = ["66.187.128.0/24"]
  security_group_id = "${data.aws_security_group.SG-2.id}"
}

resource "aws_security_group_rule" "SG2R5" {
  type        = "ingress"
  from_port   = 515
  to_port     = 515 
  protocol    = "TCP"
  cidr_blocks = ["66.187.128.0/24"]
  security_group_id = "${data.aws_security_group.SG-2.id}"
}

resource "aws_security_group_rule" "SG2R6" {
  type        = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${data.aws_security_group.SG-2.id}"
}

resource "aws_security_group_rule" "SG3R1" {
  type        = "ingress"
  from_port   = 8080
  to_port     = 8080 
  protocol    = "TCP"
  source_security_group_id = "${data.aws_security_group.SG-2.id}"
  security_group_id = "${data.aws_security_group.SG-3.id}"
}

resource "aws_security_group_rule" "SG3R2" {
  type        = "ingress"
  from_port   = 1414
  to_port     = 1414 
  protocol    = "TCP"
  source_security_group_id = "${data.aws_security_group.SG-2.id}"
  security_group_id = "${data.aws_security_group.SG-3.id}"
}

resource "aws_security_group_rule" "SG3R3" {
  type        = "ingress"
  from_port   = 515
  to_port     = 515 
  protocol    = "TCP"
  source_security_group_id = "${data.aws_security_group.SG-2.id}"
  security_group_id = "${data.aws_security_group.SG-3.id}"
}

resource "aws_security_group_rule" "SG3R4" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443 
  protocol    = "TCP"
  source_security_group_id = "${data.aws_security_group.SG-2.id}"
  security_group_id = "${data.aws_security_group.SG-3.id}"
}

resource "aws_security_group_rule" "SG3R5" {
  type        = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${data.aws_security_group.SG-3.id}"
}

resource "aws_security_group_rule" "SG4R1" {
  type        = "ingress"
  from_port   = 0
  to_port     = 0 
  protocol    = "-1"
  source_security_group_id = "${data.aws_security_group.SG-4.id}"
  security_group_id = "${data.aws_security_group.SG-4.id}"
}

resource "aws_security_group_rule" "SG4R2" {
  type        = "ingress"
  from_port   = 0
  to_port     = 0 
  protocol    = "-1"
  source_security_group_id = "${data.aws_security_group.SG-2.id}"
  security_group_id = "${data.aws_security_group.SG-4.id}"
}

resource "aws_security_group_rule" "SG4R3" {
  type        = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${data.aws_security_group.SG-4.id}"
}