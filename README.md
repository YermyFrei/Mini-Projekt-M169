# Docker-Webserver mit Apache

## 1. Überblick
In diesem Mini-Projekt wird ein ein Docker image erttellt um mit einem apatche server eine webseite zu hosten.
um die daten vor verlust beim entfernen zu schützen wird dabei ein volume verwendet.

## 2. Anforderungen
- Docker muss installiert sein
- Git (optional für die Versionsverwaltung)

## 3. Repository herunterladen
```sh
git clone https://github.com/YermyFrei/Mini-Projekt-M169.git
cd Mini-Projekt-M169
```

## 4. Image erstellen
```sh
docker build -t apache-server .
```

## 5. Container starten
```sh
docker run -d -p 8080:80 \
  -v $(pwd)/website:/usr/local/apache2/htdocs:ro \
  -v $(pwd)/logs:/usr/local/apache2/logs \
  --name apache apache-server
```

## 6. Zugriff auf die Webseite
Im Browser aufrufen:
```
http://localhost:8080
```

## 7. Log-Dateien anzeigen
```sh
docker logs apache
```

## 8. Container stoppen und entfernen
```sh
docker stop webserver-container
```
```sh
docker rm webserver-container
```
