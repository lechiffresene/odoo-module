# Utilisez l'image de base officielle d'Odoo 16
FROM odoo:16

# Copiez votre configuration personnalisée d'Odoo dans l'image
COPY ./odoo.conf /etc/odoo/odoo.conf

# Copiez votre fichier entrypoint.sh dans l'image
COPY ./entrypoint.sh /entrypoint.sh

# Définissez l'utilisateur root pour pouvoir effectuer des modifications
USER root

# Installez les dépendances système supplémentaires si nécessaire
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libsasl2-dev \
    libldap2-dev \
    libjpeg-dev \
    libpq-dev \
    libjpeg62-turbo-dev \
    libwebp-dev \
    libtiff5-dev \
    libopenjp2-7-dev \
    liblcms2-dev \
    libtiff-dev \
    libyaml-dev \
    libffi-dev \
    liblz-dev \
    libjpeg-dev \
    liblcms2-dev \
    libblas-dev \
    libatlas-base-dev \
    python3-dev \
    python3-ldap \
    libldap2-dev \
    libsasl2-dev \
    freetds-dev \
    libssl-dev \
    libsnmp-dev \
    libssl-dev \
    libffi-dev \
    libsasl2-dev \
    python3-setuptools \
    libmysqlclient-dev \
    python3-pip \
    libxslt-dev \
    libxml2 \
    libxml2-dev \
    libjpeg62-turbo-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Changez l'utilisateur à nouveau à l'utilisateur Odoo par défaut
USER odoo

# Exposez le port d'Odoo si nécessaire
EXPOSE 8069

# Définissez l'entrée de démarrage du conteneur sur entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
