variable "name" {
    type = string
}

output "hello_user" {
    value = "Hello, ${var.name}!"
}
