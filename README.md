# Docker-Webserver mit Apache

## 1. Überblick
In diesem Mini-Projekt wird ein ein Docker image erttellt um mit einem apatche server eine webseite zu hosten.
um die daten vor verlust beim entfernen zu schützen wird dabei ein volume verwendet.

## 2. Voraussetzungen
- Docker muss installiert sein
- Git (optional für die Versionsverwaltung)

## 3. Repository herunterladen
```sh
git clone https://github.com/YeremyFrei/Mini-Projekt-M169
cd WebserverImageDocker
```

## 4. Docker-Image erstellen
```sh
docker build -t apache-server.
```

## 5. Container starten
```sh
docker run -d -p 8080:80 \
  -v $(pwd)/website:/usr/local/apache2/htdocs:ro \
  -v $(pwd)/logs:/usr/local/apache2/logs \
  --name webserver-container apache-server
```

## 6. Zugriff auf die Webseite
Im Browser aufrufen:
```
http://localhost:8080
```

## 7. Log-Dateien anzeigen
```sh
docker logs webserver-container
```

## 8. Container stoppen und entfernen
```sh
docker stop webserver-container
```
```sh
docker rm webserver-container
```
