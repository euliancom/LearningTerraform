module "merge_tags_list" {
  source       = "../tagging/merge-tags/"
  default_tags = "${local.default_tags}"
}