output "private_dns" {
  value = aws_instance.private_web.private_dns
}

output "public_dns" {
  value = aws_instance.web.public_dns
}