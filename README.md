# Docker-Webserver mit Apache

## 1. Überblick
In diesem Mini-Projekt wird ein ein Docker image erttellt um mit einem apatche server eine webseite zu hosten.

## 2. Anforderungen
- Docker muss installiert sein

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
  -v $(pwd)/index.html:/usr/local/apache2/htdocs/index.html:ro \
  -v $(pwd)/logs:/usr/local/apache2/logs \
  --name apache apache-server
```
## 6. Log-Dateien anzeigen
```sh
docker logs apache
```

## 7. Zugriff auf die Webseite
Im Browser aufrufen:
```
http://localhost:8080
```
## 8. Hinweise
Die Verwendete html Webseite wurde mit chatgpt erstellt.

