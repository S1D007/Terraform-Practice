resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.public_eip.id
  subnet_id     = aws_subnet.public_subnet-1.id

  tags = {
    Name = "test-nat-gateway"
  }
}