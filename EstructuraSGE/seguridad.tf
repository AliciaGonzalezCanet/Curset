
# Grup de seguretat per a Odoo (públic)
resource "aws_security_group" "odoo_sg" {
  name        = "odoo-sg"
  description = "Permetre accés a Odoo ports 22, 80,443,8069"
  vpc_id      = aws_vpc.odoo_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8069
    to_port     = 8069
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Grup de seguretat per a PostgreSQL (privat)
resource "aws_security_group" "postgres_sg" {
  name        = "postgres-sg"
  description = "Permetre accés només des d’Odoo port 5432"
  vpc_id      = aws_vpc.odoo_vpc.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.odoo_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

