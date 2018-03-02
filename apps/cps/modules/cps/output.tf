output cps_instsnce_id {
  value = ["${module.cps_ec2.instance_id}"]
}

output cps_instance_private_ip {
  value = "${module.cps_ec2.instance_private_ip}"
}

output cps_jscape_instsnce_id {
  value = ["${module.cps_jscape.instance_id}"]
}

output cps_jscape_instance_private_ip {
  value = "${module.cps_jscape.instance_private_ip}"
}
