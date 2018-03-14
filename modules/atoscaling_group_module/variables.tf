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

variable "load_balancers" {
  type = "string"
}

variable "image_id" {
  type = "string"
}

variable "availability_zones" {
  type = "list"
}