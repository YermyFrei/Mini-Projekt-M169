# Dokumentation: Apache-Webserver in Docker

## Übersicht
Dieses Projekt ermöglicht es, einen Apache-Webserver in einem Docker-Container zu betreiben, um eine statische Webseite bereitzustellen. Die Webseiten-Dateien und Log-Dateien werden mittels Volumes verwaltet, sodass sie unabhängig vom Lebenszyklus des Containers erhalten bleiben.

## Technologien
- **Docker**: Containerisierung der Webserver-Umgebung
- **Apache HTTP Server**: Bereitstellung der statischen Inhalte
- **Markdown**: Dokumentation des Projekts

## Verzeichnisstruktur
```
WebserverDocker/
├── website/                # Enthält die statischen HTML-Dateien
│   ├── index.html          # Hauptseite der Webseite
├── logs/                   # Speichert die Log-Dateien des Webservers
├── Dockerfile              # Anweisungen zum Erstellen des Docker-Images
├── README.md               # Nutzungshinweise für das Projekt
├── documentation.md        # Ausführliche Projektbeschreibung
```

## Aufbau des Dockerfiles
Das **Dockerfile** basiert auf dem offiziellen `httpd`-Image. Die Webseite wird in das Verzeichnis `/usr/local/apache2/htdocs/` kopiert.
```dockerfile
FROM httpd:latest
WORKDIR /usr/local/apache2/htdocs/
COPY ./website /usr/local/apache2/htdocs/
EXPOSE 8080
CMD ["httpd", "-D", "FOREGROUND"]
```

## Container starten und Volumes einbinden
Mit folgendem Befehl wird der Container gestartet. Die Webseiten-Dateien und Log-Dateien werden als Volumes eingebunden:
```sh
docker run -d -p 8080:80 \
  -v $(pwd)/website:/usr/local/apache2/htdocs \
  -v $(pwd)/logs:/var/log/apache2 \
  --name apache-container apache-webserver
```

## Zusammenfassung
Dieses Setup ermöglicht die schnelle Bereitstellung einer statischen Webseite in einem Docker-Container mit Apache. Die Nutzung von Volumes sorgt dafür, dass Inhalte und Log-Daten auch nach einem Neustart des Containers verfügbar bleiben.

