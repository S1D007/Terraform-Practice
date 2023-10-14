variable "access_key" {
  type = string
}

variable "key_name" {
  type = string
}

variable "public_key_name" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "tags" {
  type = map(string)
}


# Security Group Variables

variable "security_group_name" {
  type = string
}

variable "security_group_description" {
  type = string
}


# Ingress Rules
variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}