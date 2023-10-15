# resource "aws_security_group" "public-sg" {
#   name        = "public-sg"
#   description = "Security group for the public subnet"
#   vpc_id      = aws_vpc.test_vpc.id

#   ingress {
#     description = "HTTP from VPC"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = [aws_vpc.test_vpc.cidr_block]
#   }

#   ingress {
#     description = "SSH from specific IP"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Allow necessary outbound traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "public-sg"
#   }

#   provider = aws
# }

# resource "aws_security_group" "private-sg" {
#   name        = "private-sg"
#   description = "Security group for the private subnet"
#   vpc_id      = aws_vpc.test_vpc.id


#   egress {
#     description = "Deny all outbound traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "private-sg"
#   }

#   provider = aws
# }

# resource "aws_security_group" "load_balancer_sg" {
#   name        = "load-balancer-sg"
#   description = "Security group for the load balancer"
#   vpc_id      = aws_vpc.test_vpc.id

#   ingress {
#     description = "HTTP from VPC"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = [aws_vpc.test_vpc.cidr_block]
#   }

#   egress {
#     description = "Allow necessary outbound traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group" "ecs_sg" {
#   name        = "ecs-sg"
#   description = "Security group for the ECS cluster"
#   vpc_id      = aws_vpc.test_vpc.id

#   ingress {
#     description = "Allow all inbound traffic from the load balancer"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#   }

#   ingress {
#     description = "Allow all inbound traffic from the ECS cluster"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#   }

#   egress {
#     description = "Allow all outbound traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

resource "aws_security_group" "jump-server-sg" {
  name        = "jump-server-sg"
  description = "Security group for the jump server"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description = "SSH from specific IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow necessary outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "app-sg" {
  name        = "app-sg"
  description = "Security group for the app"
  vpc_id      = aws_vpc.test_vpc.id

  # allow only jump server to access the app
  ingress {
    description     = "Allow SSH from jump server"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.jump-server-sg.id]
  }

  ingress {
    description     = "Allow ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb-sg.id]
  }

  egress {
    description = "Allow necessary outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb-sg" {
  name        = "alb-sg"
  description = "Security group for the app"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    description = "Allow HTTP from public"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow necessary outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
