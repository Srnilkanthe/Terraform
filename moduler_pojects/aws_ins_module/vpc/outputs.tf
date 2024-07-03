output "my_subnet1" {
  value = aws_subnet.my_subnet.id
}
output "my_sg1" {
    value = aws_security_group.my_sg.id
  
}