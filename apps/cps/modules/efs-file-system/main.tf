resource "aws_efs_file_system" "efs_file_system" {
  creation_token = "${var.creation_token}"

  tags = "${merge(
      var.tags_default,
      map(
         "Name", 
         "${var.name}",
         )
      )
  }"
}
