module "child" {
  source    = "../../modules/ec2_eni_module"

  user_data = "${data.template_file.user_data}"
}
