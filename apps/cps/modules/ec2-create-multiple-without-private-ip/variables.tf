variable "ami_id" {}
variable "instance_type" {}
variable "instance_count" {}

variable "name" {
  default = ""
}

variable "subnet_id" {}

variable "tags_default" {
  type = "map"
  default = {}
}

variable "aws_iam_instance_profile" {}
variable "key_name" {}
variable "security_group_ids" {}
variable "ec2_user_data" {}
