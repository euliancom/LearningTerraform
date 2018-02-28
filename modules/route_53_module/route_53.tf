resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = "${var.route53_record_name}"
  type    = "${var.route53_record_type}"

  alias {
    name                   = "${var.elb_dns_name}"
    zone_id                = "${var.elb_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_zone" "primary" {
  name = "${var.route53_zone_name}"
}
