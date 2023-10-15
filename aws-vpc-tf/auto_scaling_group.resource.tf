# resource "aws_placement_group" "test-pg" {
#   name     = "test-pg"
#   strategy = "cluster"
# }

# resource "aws_autoscaling_group" "test-asg" {
#   name                      = "foobar3-terraform-test"
#   max_size                  = 5
#   min_size                  = 2
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   desired_capacity          = 4
#   force_delete              = true
#   placement_group           = aws_placement_group.test-pg.id
#   launch_configuration      = aws_launch_configuration.test-lc.name
#   vpc_zone_identifier       = [aws_subnet.public_subnet.id, aws_subnet.public_subnet2.id]

# }

# resource "aws_autoscaling_policy" "test-asg-policy" {
#   name                      = "test-autoscaling-policy"
#   autoscaling_group_name    = aws_autoscaling_group.test-asg.name
#   policy_type               = "TargetTrackingScaling"
#   estimated_instance_warmup = 300

#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ASGAverageCPUUtilization"
#     }

#     target_value = 80.0
#   }
# }
