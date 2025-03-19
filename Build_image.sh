#!/bin/bash
# Erstellt das Docker-Image

cat > Dockerfile <<EOF
FROM httpd:latest
COPY html/ /usr/local/apache2/htdocs/
VOLUME [ "/usr/local/apache2/htdocs", "/usr/local/apache2/logs" ]
EXPOSE 8080
CMD ["httpd-foreground"]
EOF

docker build -t my-apache .
echo "Docker-Image erstellt: my-apache"
