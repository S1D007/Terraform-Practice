# resource "aws_ecs_task_definition" "test-task-def" {
#   family = "test-task-family"
#   memory = 512
#   container_definitions = jsonencode([
#     {
#       name  = "test-container"
#       image = "nginx:latest"
#       portMappings = [
#         {
#           containerPort = 80
#           hostPort      = 80
#         }
#       ]
#     }
#   ])

#   # network_mode = "awsvpc"
# }
