output "odoo_public_ip" {
  value = aws_instance.odoo.public_ip
}

output "postgres_private_ip" {
  value = aws_instance.postgres.private_ip
}

