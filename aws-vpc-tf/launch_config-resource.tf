# resource "aws_launch_configuration" "test-lc" {
#   name            = "test-launch-configuration"
#   image_id        = data.aws_ami.latest_ubuntu.image_id
#   instance_type   = var.instance_type
#   security_groups = [aws_security_group.ecs_sg.id]
# }