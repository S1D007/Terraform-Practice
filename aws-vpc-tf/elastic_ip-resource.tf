resource "aws_eip" "public_eip" {
  tags = {
    Name = "test-eip"
  }
  provider = aws
}
