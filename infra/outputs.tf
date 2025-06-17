output "node_app_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_eip.node_app_eip.public_ip
}
