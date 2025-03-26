# Docker-basierter Apache-Webserver

## Projektbeschreibung
Dieses Projekt demonstriert, wie ein Apache-Webserver in einem Docker-Container betrieben wird, um eine statische Webseite bereitzustellen. Mithilfe von Volumes bleiben sowohl Webseiten-Dateien als auch Log-Daten unabhängig vom Container erhalten.

## Einsatz von Technologien
- **Docker** – Containerisierung der Webserver-Umgebung
- **Apache HTTP Server** – Hosting statischer Inhalte
- **Markdown** – Dokumentation und Strukturierung des Projekts


## Dockerfile: Erstellung des Images
Das **Dockerfile** nutzt das Basis-Image `httpd:latest` und kopiert die Webseite in den entsprechenden Ordner für Apache.
```dockerfile
FROM httpd:latest
WORKDIR /usr/local/apache2/htdocs
COPY website/ .
EXPOSE 8080
CMD ["httpd", "-D", "FOREGROUND"]
```

## Container-Start mit Volumes
Um den Container zu starten und Dateien als Volumes einzubinden, verwende den folgenden Befehl:
```sh
docker run -d -p 8080:80 \
  -v $(pwd)/website:/usr/local/apache2/htdocs:ro \
  -v $(pwd)/logs:/usr/local/apache2/logs \
  --name my-apache-server my-apache-image
```

## Fazit
Durch den Einsatz von Docker kann eine statische Webseite einfach und effizient mit Apache bereitgestellt werden. Volumes gewährleisten, dass sowohl die Webinhalte als auch die Server-Logs erhalten bleiben, selbst wenn der Container gestoppt oder entfernt wird.
