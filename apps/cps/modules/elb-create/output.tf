output "elb_id" {
  value = "${aws_elb.elb_create.*.id}"
}

output "elb_name" {
  value = "${aws_elb.elb_create.*.name}"
}

output "elb_dns_name" {
  value = "${aws_elb.elb_create.*.dns_name}"
}

output "elb_zone_id" {
  value = "${aws_elb.elb_create.*.zone_id}"
}
