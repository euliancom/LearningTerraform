variable "name" {type = "list"}
variable "internal" {
  default = "false"
}

variable "subnet_ids" {
  type = "list"
}

variable "security_groups" {
  type = "list"
}

variable "instance_ports" {type = "list"}

variable "instance_protocol" {
  default = "http"
}

variable "elb_port" {}
variable "env" {}
variable "elb_count" {default = 1}

variable "lb_protocol" {
  default = "http"
}

variable "healthy_threshold" {
  default = 2
}

variable "unhealthy_threshold" {
  default = 5
}

variable "timeout" {
  default = 3
}

variable "interval" {
  default = 30
}

variable "instance_id" {
  type = "list"
}

variable "cross_zone_load_balancing" {
  default = true
}

variable "idle_timeout" {
  default = 400
}

variable "connection_draining" {
  default = true
}

variable "connection_draining_timeout" {
  default = 400
}

variable "tag_name" {
  default = []
  type = "list"
}

variable "tags_default" {
  type = "map"
  default = {}
}