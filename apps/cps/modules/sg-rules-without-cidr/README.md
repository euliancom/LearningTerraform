# sg-rules-without-cidr

This module incapsulates add Aws Security Group rules with sg_self.

## input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|type|The type of rule being created. Valid options are ingress (inbound) or egress (outbound).|string||Yes|
|ports|The start port.|list||Yes|
|protocol|The protocol. If not icmp, tcp, udp, or all use the protocol number.|string||Yes|
|sg_self|If true, the security group itself will be added as a source to this ingress rule.|string||Yes|
|security_group_id|The security group to apply this rule to.|string||Yes|


## Example ##

1. run sg-rules-without-cidr module

``` hcl
module "efs_cps_sg_rules_without_cidr" {
  source = "git::git@github.com:ThomsonReuters-IPS/cc-terraform-modules.git//sg-rules-without-cidr?ref=v0.0.1"

  type              = "ingress"
  ports             = [21,80]
  protocol          = "tcp"
  sg_self           = "true"
  security_group_id = "sg-80150ffc"
}
```