data "aws_region" "current" {
  current = true
}

data "aws_route53_zone" "private_zone" {
  name         = "${var.dns_zone_name}"
  private_zone = false
}

data "template_file" "user_data_cps" {
  template = <<EOF
export CLOUD_ENVIRONMENT=$${env}
export CLOUD_SUBENVIRONMENT=stable
export EMAIL_RECIPIENT=
export CLOUD_STACK=
export CLOUD_CLUSTER=
export CLOUD_AUTO_SCALE_GROUP=
export CLOUD_LAUNCH_CONFIG=
export EC2_REGION=us-west-2
export CLOUD_DEV_PHASE=stable
export CLOUD_REVISION=
export CLOUD_DOMAIN="cc.oneplatform.build"
export CLOUD_APP="cps"
export EFS_DATA=${aws_efs_mount_target.efs_mount_target.efs_dns_name}
export EFS_NONDATA=${aws_efs_mount_target.nondata_aws_efs_mount_target.efs_dns_name}
EOF

  vars {
    env = "${var.env}"
  }
}

data "template_file" "user_data_cps_jscape" {
  template = <<EOF
export CLOUD_ENVIRONMENT=$${env}
export CLOUD_SUBENVIRONMENT=stable
export EMAIL_RECIPIENT=
export CLOUD_STACK=
export CLOUD_CLUSTER=
export CLOUD_AUTO_SCALE_GROUP=
export CLOUD_LAUNCH_CONFIG=
export EC2_REGION=us-west-2
export CLOUD_DEV_PHASE=stable
export CLOUD_REVISION=
export CLOUD_DOMAIN="cc.oneplatform.build"
export CLOUD_APP="cps-jscape"
export EFS_DATA=${aws_efs_mount_target.efs_mount_target.efs_dns_name}
export EFS_NONDATA=${aws_efs_mount_target.nondata_aws_efs_mount_target.efs_dns_name}
EOF

  vars {
    env = "${var.env}"
  }
}
