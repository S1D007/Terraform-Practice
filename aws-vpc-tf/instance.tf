resource "aws_instance" "test-instance-public" {
  ami                         = data.aws_ami.latest_ubuntu.image_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [aws_security_group.jump-server-sg.id]
  subnet_id                   = aws_subnet.public_subnet-1.id
  associate_public_ip_address = true
  tags = {
    Name = "My-Jump-Server"
  }
  provider = aws

}

resource "aws_instance" "test-instance-private-app-1" {
  ami                         = data.aws_ami.latest_ubuntu.image_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [aws_security_group.app-sg.id]
  subnet_id                   = aws_subnet.private_subnet-1-app.id
  associate_public_ip_address = false
  tags = {
    Name = "Test-App-1"
  }
  provider = aws

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y nginx
              sudo echo "Hello World from $(hostname -f)" > /var/www/html/index.html
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}

resource "aws_instance" "test-instance-private-app-2" {
  ami                         = data.aws_ami.latest_ubuntu.image_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [aws_security_group.app-sg.id]
  subnet_id                   = aws_subnet.private_subnet-2-app.id
  associate_public_ip_address = false
  tags = {
    Name = "Test-App-2"
  }
  provider = aws

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y nginx
              echo "Hello World from $(hostname -f)" > /var/www/html/index.html
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}

# resource "aws_instance" "test-instance-private-app-3" {
#   ami                         = data.aws_ami.latest_ubuntu.image_id
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   security_groups             = [aws_security_group.app-sg.id]
#   subnet_id                   = aws_subnet.private_subnet-3-app.id
#   associate_public_ip_address = false
#   tags = {
#     Name = "Test-App-3"
#   } 
#   provider = aws
#   user_data = <<-EOF
#               #!/bin/bash
#               sudo apt-get update -y
#               sudo apt-get install -y nginx
#               echo "Hello World from $(hostname -f)" > /var/www/html/index.html
#               sudo systemctl start nginx
#               sudo systemctl enable nginx
#               EOF
# }

# resource "aws_instance" "test-instance-private" {
#   ami                         = data.aws_ami.latest_ubuntu.image_id
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   security_groups             = [aws_security_group.private-sg.id]
#   subnet_id                   = aws_subnet.private_subnet.id
#   associate_public_ip_address = false
#   tags = {
#     Name = "test-instance-private"
#   }
#   provider = aws
# }

# resource "aws_instance" "name" {

# }