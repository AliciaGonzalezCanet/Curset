#!/bin/bash
apt update
sudo apt install build-essential python3-pillow python3-lxml python3-dev python3-pip python3-setuptools libpq-dev npm nodejs git libldap2-dev libsasl2-dev libxml2-dev libxslt1-dev libjpeg-dev apache2  xfonts-75dpi xfonts-base libpq-dev libffi-dev fontconfig -y

# Instal·lar PostgreSQL client per a connectar a DB remota
apt install -y postgresql-client

# Crear usuari per a odoo
useradd -m -d /opt/odoo -U -r -s /bin/bash odoo
su - odoo -c "git clone https://www.github.com/odoo/odoo --depth 1 --branch 16.0 /opt/odoo/odoo"

# Dependències Python
pip3 install wheel setuptools pip --upgrade 
pip3 install -r /opt/odoo/odoo/requeriments.txt 

# Crear config
cat <<EOF > /etc/odoo.conf
[options]
addons_path = /opt/odoo/odoo/addons
data_dir = /opt/odoo/.local/share/Odoo
logfile = /var/log/odoo/odoo-server.log
db_host = ${postgres_private_ip}
db_port = 5432
db_user = odoo
db_password = odoo
EOF

chown odoo: /etc/odoo.conf
chmod 640 /etc/odoo.conf

# -------------------------------
# Crea el servei systemd per a Odoo
# -------------------------------
cat <<EOF > /etc/systemd/system/odoo.service
[Unit]
After=network.target

[Service]
Type=simple
User=odoo
ExecStart=/usr/bin/python3 /opt/odoo/odoo/odoo-bin -c /etc/odoo.conf
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# -------------------------------
# Inicia i activa el servei
# -------------------------------

systemctl enable odoo
systemctl start odoo

