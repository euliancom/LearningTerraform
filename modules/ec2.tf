resource "aws_instance" "ec2" {
  ami           = "${var.instance_ami}"
  instance_type = "t2.micro"
}