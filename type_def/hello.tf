output "Hello_Father" {
    value = "${var.your_name}: Hello, Father, How are you??, \n ${var.father_name}: Hey Son :)"
}

output "My_birthday" {
    value = "Hey ${var.your_name}, Happy ${var.your_age}th Birthday!!"
}