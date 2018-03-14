variable "subnet_id" {
  type = "string"
}

variable "eni_private_ips" {
  type = "string"
}

variable "vpc_tag_name" {
  type = "string"
}

variable "ec2_tag_name" {
  type = "string"
}

variable "key_name" {
  type = "string"
}

variable "instance_ami" {
  type = "string"
}

variable "group_name" {
  type = "string"
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

variable "min_size" {
  type = "string"
}

variable "max_size" {
  type = "string"
}

variable "health_check_grace_period" {
  type = "string"
}

variable "health_check_type" {
  type = "string"
}

variable "launch_config_name" {
  type = "string"
}

variable "instance_type" {
  type = "string"
}

variable "key" {
  type = "string"
}

variable "value" {
  type = "string"
}

variable "propagate_at_launch" {
  type = "string"
}
