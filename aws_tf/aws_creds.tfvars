access_key    = "***"
secret_key    = "***"
region        = "ap-south-1"
ami_id        = "ami-0287a05f0ef0e9d9a"
instance_type = "t2.micro"
tags = {
  "Name" = "first-tf-instance"
}
key_name                   = "test1"
public_key_name            = "test.pub"
security_group_description = "Allow SSH and HTTP inbound traffic"
security_group_name        = "test-sg"

# ingress rules
ingress_rules = [{
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }, {
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }, {
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}]
