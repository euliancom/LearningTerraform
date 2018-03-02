# sg-rules-with-cidr

This module incapsulates add Aws Security Group rules with sg_cidr_blocks.

## input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|type|The type of rule being created. Valid options are ingress (inbound) or egress (outbound).|string||Yes|
|ports|The start port.|list||Yes|
|protocol|The protocol. If not icmp, tcp, udp, or all use the protocol number.|string||Yes|
|sg_cidr_blocks|List of CIDR blocks. Cannot be specified with source_security_group_id.|string||Yes|
|security_group_id|The security group to apply this rule to.|string||Yes|


## Example ##

1. run sg-rules-with-cidr module

``` hcl
module "efs_cps_sg_rules_with_cidr_all" {
  source = "git::git@github.com:ThomsonReuters-IPS/cc-terraform-modules.git//sg-rules-with-cidr?ref=v0.0.1"

  type              = "egress"
  ports             = [21,80]
  protocol          = "-1"
  sg_cidr_blocks    = "0.0.0.0/0"
  security_group_id = "sg-80150ffc"
}
```