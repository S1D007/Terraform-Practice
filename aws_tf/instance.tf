resource "aws_instance" "test" {
  ami           = var.ami_id
  key_name      = aws_key_pair.ssh-key-rsa.key_name
  instance_type = var.instance_type
  tags          = var.tags
  security_groups = [
    "${aws_security_group.allow_tls.name}"
  ]

  provisioner "file" {
    source      = "${path.module}/nginx.sh"
    destination = "/tmp/nginx.sh"
    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/id_rsa")
    }
  }
}
