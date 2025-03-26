#!/bin/bash
# Erstellt das Docker-Image

# Basis-Image mit Apache
FROM httpd:latest

# Arbeitsverzeichnis setzen
WORKDIR /usr/local/apache2/htdocs/

# Statische Webseite in den Container kopieren
COPY ./webseite.html /usr/local/apache2/htdocs/index.html

# Exponiere Port 8080
EXPOSE 8080

# Apache starten
CMD ["httpd", "-D", "FOREGROUND"]
