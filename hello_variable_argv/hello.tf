variable "username" {
    type = string
}

output "hello_user" {
    value = "Hello, ${var.username}!"
}
