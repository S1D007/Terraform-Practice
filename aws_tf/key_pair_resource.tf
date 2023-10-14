resource "aws_key_pair" "ssh-key-rsa" {
  key_name   = var.key_name
  public_key = file("${path.module}/${var.public_key_name}")
}