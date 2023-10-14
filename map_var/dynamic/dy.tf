variable "users" {
    type = map
    default = {
        "user1" = "1"
        "user2" = "2"
        "user3" = "3"
    }
}
  
variable "show" {
    type = string
}

output "print" {
    value = "Hey ${lookup(var.users, "${var.show}")}"
}