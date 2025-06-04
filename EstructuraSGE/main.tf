provider "aws" {
  region = var.region
}

resource "aws_instance" "odoo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = var.key_name
  security_groups = [aws_security_group.odoo_sg.id]

  user_data = file("${path.module}/userdata/user-data-odoo.sh")

  tags = {
    Name = "Odoo-Server"
  }
}

resource "aws_instance" "postgres" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet.id
  key_name      = var.key_name
  security_groups = [aws_security_group.postgres_sg.id]

  user_data = file("${path.module}/userdata/user-data-postgres.sh")

  tags = {
    Name = "PostgreSQL-Server"
  }
}





