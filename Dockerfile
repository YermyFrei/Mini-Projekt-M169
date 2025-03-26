#!/bin/bash
# Erstellt das Docker-Image

FROM httpd:latest
WORKDIR /usr/local/apache2/htdocs/
COPY ./index.html /usr/local/apache2/htdocs/index.html
EXPOSE 8080
CMD ["httpd", "-D", "FOREGROUND"]
