resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.test_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "test-public-route-table"
  }

  provider = aws
}


resource "aws_route_table" "private_route_table_app" {
  vpc_id = aws_vpc.test_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "test-private-route-table_app"
  }

  provider = aws
}

resource "aws_route_table" "private_route_table_db" {
  vpc_id = aws_vpc.test_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "test-private-route-table_db"
  }

  provider = aws
}

resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = aws_subnet.public_subnet-1.id
  route_table_id = aws_route_table.public_route_table.id
  provider       = aws
}

resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = aws_subnet.public_subnet-2.id
  route_table_id = aws_route_table.public_route_table.id
  provider       = aws
}

resource "aws_route_table_association" "public_route_table_association_3" {
  subnet_id      = aws_subnet.public_subnet-3.id
  route_table_id = aws_route_table.public_route_table.id
  provider       = aws
}

resource "aws_route_table_association" "private_route_table_association_app_1" {
  subnet_id      = aws_subnet.private_subnet-1-app.id
  route_table_id = aws_route_table.private_route_table_app.id
  provider       = aws
}

resource "aws_route_table_association" "private_route_table_association_app_2" {
  subnet_id      = aws_subnet.private_subnet-2-app.id
  route_table_id = aws_route_table.private_route_table_app.id
  provider       = aws
}

resource "aws_route_table_association" "private_route_table_association_app_3" {
  subnet_id      = aws_subnet.private_subnet-3-app.id
  route_table_id = aws_route_table.private_route_table_app.id
  provider       = aws
}

resource "aws_route_table_association" "private_route_table_association_db_1" {
  subnet_id      = aws_subnet.private_subnet-1-db.id
  route_table_id = aws_route_table.private_route_table_db.id
  provider       = aws
}

resource "aws_route_table_association" "private_route_table_association_db_2" {
  subnet_id      = aws_subnet.private_subnet-2-db.id
  route_table_id = aws_route_table.private_route_table_db.id
  provider       = aws
}

resource "aws_route_table_association" "private_route_table_association_db_3" {
  subnet_id      = aws_subnet.private_subnet-3-db.id
  route_table_id = aws_route_table.private_route_table_db.id
  provider       = aws
}
