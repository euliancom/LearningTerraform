resource "aws_efs_file_system" "efs" {
  creation_token = "${var.creation_token}"

  tags {
    Name = "${var.efs_tag_name}"
  }
}