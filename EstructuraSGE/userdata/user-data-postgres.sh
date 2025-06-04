#!/bin/bash

# -------------------------------
# Instal·la PostgreSQL
# -------------------------------
apt update
apt install -y postgresql postgresql-contrib

# -------------------------------
# Configura la base de dades
# -------------------------------
sudo -u postgres psql <<EOF
CREATE USER odoo WITH PASSWORD 'odoo';
CREATE DATABASE odoo OWNER odoo;
EOF

# -------------------------------
# Permet connexions remotes segures
# -------------------------------
echo "listen_addresses = '*'" >> /etc/postgresql/*/main/postgresql.conf

# Accepta connexions des de la subxarxa de Odoo (exemple: 10.0.1.0/24)
echo "host    all             all             10.0.1.0/24           md5" >> /etc/postgresql/*/main/pg_hba.conf

# -------------------------------
# Reinicia PostgreSQL
# -------------------------------
systemctl restart postgresql






