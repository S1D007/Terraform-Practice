resource "aws_lb" "test-lb" {
  name                       = "test-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb-sg.id]
  subnets                    = [aws_subnet.public_subnet-1.id, aws_subnet.public_subnet-2.id]
  enable_deletion_protection = false
}

resource "aws_lb_target_group" "test-tg" {
  target_type = "instance"
  name        = "test-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.test_vpc.id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "test-listner" {
  load_balancer_arn = aws_lb.test-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-tg.arn
  }
}

resource "aws_lb_target_group_attachment" "test-tg-attachment-1" {
  target_group_arn = aws_lb_target_group.test-tg.arn
  target_id        = aws_instance.test-instance-private-app-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "test-tg-attachment-2" {
  target_group_arn = aws_lb_target_group.test-tg.arn
  target_id        = aws_instance.test-instance-private-app-2.id
  port             = 80
}
