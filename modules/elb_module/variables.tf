variable "elb_name" {
  type = "string"
}

variable "elb_availability_zones" {
  type = "list"
}

variable "subnet_ids" {
  type = "list"
}

variable "security_groups" {
  type = "list"
}

variable "elb_tag_name" {
  type = "string"
}

variable "aws_instance_id" {
  type = "string"
}