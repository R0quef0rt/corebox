output "remote_group_public_dns" {
  description = "The list of public DNS names of the remote_group instances"
  value       = ["${aws_instance.minion.*.public_dns}"]
}