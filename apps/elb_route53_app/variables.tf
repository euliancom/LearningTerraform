variable "subnet_id" {
  type = "string"
}

variable "subnet_ids" {
  type = "list"
}

variable "eni_private_ips" {
  type = "string"
}

variable "instance_ami" {
  type = "string"
}

variable "instance_type" {
  type = "string"
}

variable "vpc_tag_name" {
  type = "string"
}

variable "key_name" {
  type = "string"
}

variable "ec2_tag_name" {
  type = "string"
}

variable "group_name" {
  type = "string"
}

variable "security_groups" {
  type = "list"
}

variable "elb_name" {
  type = "string"
}

variable "elb_availability_zones" {
  type = "list"
}

variable "elb_tag_name" {
  type = "string"
}

variable "route53_zone_name" {
  type = "string"
}

variable "route53_record_name" {
  type = "string"
}

variable "route53_record_type" {
  type = "string"
}

# variable "region" {
#   type = "string"
# }

# variable "account_id" {
#   type = "string"
# }
