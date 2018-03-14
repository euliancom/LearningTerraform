###################
# cps aws route53 #
###################

resource "aws_route53_record" "www" {
  zone_id = "${data.aws_route53_zone.private_zone.zone_id}"
  name    = "${element(var.efs_elb_names,count.index)}"
  type    = "CNAME"
  ttl     = "300"
  count   = "${var.cps_elb_count}"
  records = ["${element(aws_elb.cps_aws_elb.elb_dns_name,count.index)}"]
}

resource "aws_route53_record" "app" {
  zone_id = "${data.aws_route53_zone.private_zone.zone_id}"
  name    = "cats-engine"
  type    = "CNAME"
  ttl     = "300"
  count   = 1
  records = ["${element(aws_elb.cps_aws_elb_apache.elb_dns_name,count.index)}"]
}

###################
# cps aws route53 #
###################

resource "aws_route53_record" "www_jscape" {
  zone_id = "${data.aws_route53_zone.private_zone.zone_id}"
  name    = "jscape"
  type    = "CNAME"
  ttl     = "300"
  count   = 1
  records = ["${element(aws_elb.cps_jscape_aws_elb_server.*.dns_name,count.index)}"]
}

##########################
# cps jscape aws route53 #
##########################

resource "aws_route53_record" "app_jscape" {
  zone_id = "${data.aws_route53_zone.private_zone.zone_id}"
  name    = "cps"
  type    = "CNAME"
  ttl     = "300"
  count   = 1
  records = ["${element(aws_elb.cps_aws_elb_jscape.elb_dns_name,count.index)}"]
}
