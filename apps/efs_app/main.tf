module "ec2_eni_module" {
  source = "../../modules/ec2_eni_module"

  user_data = "${data.template_file.user_data.rendered}"

  subnet_id       = "${var.subnet_id}"
  eni_private_ips = "${var.eni_private_ips}"
  instance_type   = "${var.instance_type}"
  vpc_tag_name    = "${var.vpc_tag_name}"
  ec2_tag_name    = "${var.ec2_tag_name}"
  key_name        = "${var.key_name}"
  instance_ami    = "${var.instance_ami}"
  group_name      = "${var.group_name}"
}

module "efs_module" {
  source = "../../modules/efs_module"

  creation_token = "${var.creation_token}"
  efs_tag_name   = "${var.efs_tag_name}"
  subnet_id      = "${var.subnet_id}"
}

resource "null_resource" "provisioning" {
  depends_on = ["module.ec2_eni_module"]

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y nfs-utils",
      "sudo apt-get install nfs-common",
      "sudo mkdir data_efs",
      "sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${module.efs_module.efs_id}.efs.us-east-1.amazonaws.com:/ data_efs",
    ]
  }
}
