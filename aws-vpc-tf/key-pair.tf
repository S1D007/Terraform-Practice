resource "aws_key_pair" "test-key_pair" {
  key_name   = var.key_name
  public_key = file("${path.module}/${var.public_key_file_name}")
}