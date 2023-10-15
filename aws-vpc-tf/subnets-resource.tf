resource "aws_subnet" "public_subnet-1" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "test-public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet-2" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {
    Name = "test-public-subnet-2"
  }
}

resource "aws_subnet" "public_subnet-3" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true
  tags = {
    Name = "test-public-subnet-3"
  }
}

resource "aws_subnet" "private_subnet-1-app" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = false
  tags = {
    Name = "test-private-subnet-1-app"
  }
}

resource "aws_subnet" "private_subnet-2-app" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.5.0/24"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = false
  tags = {
    Name = "test-private-subnet-2-app"
  }
}

resource "aws_subnet" "private_subnet-3-app" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.6.0/24"
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = false
  tags = {
    Name = "test-private-subnet-3-app"
  }
}

resource "aws_subnet" "private_subnet-1-db" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.7.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = false
  tags = {
    Name = "test-private-subnet-1-db"
  }
}

resource "aws_subnet" "private_subnet-2-db" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.8.0/24"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = false
  tags = {
    Name = "test-private-subnet-2-db"
  }
}

resource "aws_subnet" "private_subnet-3-db" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.9.0/24"
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = false
  tags = {
    Name = "test-private-subnet-3-db"
  }
}
