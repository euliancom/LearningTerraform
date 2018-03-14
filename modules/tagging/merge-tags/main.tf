variable "default_tags" {
  type        = "map"
  description = "Default tags"

  default = {
    "tr:appName"          = "NEED TO TAG"
    "tr:environment-type" = "NEED TO TAG"
    "tr:Role"             = "NEED TO TAG"
    "ca:tier"             = "NEED TO TAG"
    "ca:owner"            = "NEED TO TAG"
    "ca:created-by"       = "terraform"
  }
}

variable "add_tags" {
  type        = "map"
  description = "Additional tags to assign, provided as input"

  default = {}
}

data "template_file" "tag_Name_value" {
  template = "$${it}"

  vars {
    it = "${format("%s.%s.%s",
           "${lookup(merge(var.default_tags, var.add_tags), "tr:appName")}",
           "${lookup(merge(var.default_tags, var.add_tags), "tr:environment-type")}",
           "${lookup(merge(var.default_tags, var.add_tags), "tr:Role")}"
    )}"
  }
}

locals {
  tag_Name = "${lookup(merge(var.default_tags, var.add_tags), "Name", data.template_file.tag_Name_value.rendered)}"
}

output "tag_Name" {
  value = "${map("Name", local.tag_Name)}"
}

output "tags_default" {
  value = "${var.default_tags}"
}

output "tags_merged" {
  value = "${merge(var.default_tags, var.add_tags, map("Name", local.tag_Name))}"
}

output "tags_merged_asg" {
  value = "${list(
      map("key", "Name",                "value", local.tag_Name,                                                       "propagate_at_launch", true),
      map("key", "tr:appName",          "value", lookup(merge(var.default_tags, var.add_tags), "tr:appName"),          "propagate_at_launch", true),
      map("key", "tr:environment-type", "value", lookup(merge(var.default_tags, var.add_tags), "tr:environment-type"), "propagate_at_launch", true),
      map("key", "tr:Role",             "value", lookup(merge(var.default_tags, var.add_tags), "tr:Role"),             "propagate_at_launch", true),
      map("key", "ca:tier",             "value", lookup(merge(var.default_tags, var.add_tags), "ca:tier"),             "propagate_at_launch", true),
      map("key", "ca:owner",            "value", lookup(merge(var.default_tags, var.add_tags), "ca:owner"),            "propagate_at_launch", true),
      map("key", "ca:created-by",       "value", lookup(merge(var.default_tags, var.add_tags), "ca:created-by"),       "propagate_at_launch", true)
  )}"
}