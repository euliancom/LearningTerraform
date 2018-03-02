# sg-rules-to-from-sg

This module incapsulates add Aws Security Group rules with source_security_group_id.

## input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|type|The type of rule being created. Valid options are ingress (inbound) or egress (outbound).|string||Yes|
|ports|The start port.|list||Yes|
|protocol|The protocol. If not icmp, tcp, udp, or all use the protocol number.|string||Yes|
|source_security_group_id|The security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks.|string||Yes|
|security_group_id|The security group to apply this rule to.|string||Yes|


## Example ##

1. run sg-rules-to-from-sg module

``` hcl
module "efs_cps_sg_rules_to_from_sg" {
  source = "git::git@github.com:ThomsonReuters-IPS/cc-terraform-modules.git//sg-rules-to-from-sg?ref=v0.0.1"

  type                     = "ingress"
  ports                    = "0"
  protocol                 = "-1"
  source_security_group_id = "sg-9b0b11e7"
  security_group_id        = "sg-80150ffc"
}
```