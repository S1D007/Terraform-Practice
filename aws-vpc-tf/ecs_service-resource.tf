# resource "aws_ecs_service" "test-ecs-service" {
#   name            = "test-ecs-service"
#   cluster         = aws_ecs_cluster.test-ecs-cluster.id
#   task_definition = aws_ecs_task_definition.test-task-def.arn
#   desired_count   = 2

#   load_balancer {
#     target_group_arn = aws_lb_target_group.test-tg.arn
#     container_name   = "test-container"
#     container_port   = 80
#   }
# }
