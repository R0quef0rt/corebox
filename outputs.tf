output "remote_group_public_dns" {
  description = "The list of public DNS names of the remote_group instances"
  value       = aws_instance.main.0.public_dns
}

