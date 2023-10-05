FROM odoo:16

USER root

RUN apt update
### /install some development  tools 
RUN apt install -y unoconv vim git

### Install some dependencies needed by ijayo modules
# RUN pip install docxtpl
# RUN apt -y install libreoffice
# RUN pip install kafka-python

### Copy custume modules addons  

### Copy entreprise  modules addons   

COPY ./enterprise_addons/  /mnt/extra-addons

### Create data folder for persistant volume
RUN mkdir -p /home/odoo_filestore \
     && chown -R odoo:odoo /home/odoo_filestore


RUN mkdir -p /home/odoo_filestore/scripts \
    && chown -R odoo:odoo /home/odoo_filestore/scripts

COPY ./script.sh  /home/odoo_filestore/scripts 

### Copy the edited entrypoint 
COPY ./entrypoint.sh  /

### Copy the edited odoo.conf
COPY ./config/odoo.conf /etc/odoo/  

### Edit permision on entrypoint.sh
RUN chown odoo /entrypoint.sh \
    && chmod 777 /entrypoint.sh

### Edit permision on odoo.conf
RUN chown odoo /etc/odoo/odoo.conf 

### Change user to odoo 
USER odoo
