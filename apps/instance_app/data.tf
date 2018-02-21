data "template_file" "user_data" {
 template = <<EOF
export CLOUD_ENVIRONMENT=dev
export CLOUD_SUBENVIRONMENT=stable
export EMAIL_RECIPIENT=jeffrey.cruz@Clarivate.com
export CLOUD_STACK=
export CLOUD_CLUSTER=
export CLOUD_AUTO_SCALE_GROUP=
export CLOUD_LAUNCH_CONFIG=
export EC2_REGION=us-west-2
export CLOUD_DEV_PHASE=stable
export CLOUD_REVISION=
export CLOUD_DOMAIN="cc.oneplatform.build"
export CLOUD_APP="dii-core-server"
EOF
}
