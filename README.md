# Curset
Mòdul SGE:

Instancia d’Ubuntu per a instal·lar Odoo.

Instancia per a montar PostgreSQL: podria ser una instancia amb PostgreSQL.

Seguretat: Pera Odoo necesitem el port 22, 80, 443 i el 8069 per accedir directament al client web. Per a postgres el port 5432.   Ací podries fer ús de grups de seguretat y subxarxes públiques i privades.

La base de dades estaria a la subxarxa privada, con un grup de seguretat que permetera el tràfic des de la màquina de Odoo en el port 5432.

La màquina Odoo estaria en una subxarxa pública, amb un grup de seguretat per a eixos ports.
