resource "aws_vpc" "test_vpc" {
  instance_tenancy     = "default"
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc_name
  }
  provider = aws
}