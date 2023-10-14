variable "users" {
    type = map
    default = {
        "user1" = "1"
        "user2" = "2"
        "user3" = "3"
    }
}
  

output "print" {
    value = "Hey ${lookup(var.users, "user1")}"
}