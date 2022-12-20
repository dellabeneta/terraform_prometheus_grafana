output "instance_server_pip" {
  value = aws_instance.server.public_ip
}

output "instance_server_pvp" {
  value = aws_instance.server.private_ip
}

output "instance_clients_pips" {
  value = aws_instance.client.*.public_ip
}

output "instance_clients_pvps" {
  value = aws_instance.client.*.private_ip
}