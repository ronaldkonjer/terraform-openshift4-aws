output "ip_address" {
  value = aws_instance.bootstrap.public_ip
}