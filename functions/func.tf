output "join" {
    value = "Hey ${join(", ", var.users)}"
}