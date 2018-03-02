variable "name" {}
variable "description" {}
variable "vpc_id" {}

variable "tag_name" {
  default = ""
}

variable "tags_default" {
  type = "map"
  default = {}
}
