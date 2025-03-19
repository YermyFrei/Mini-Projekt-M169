#!/bin/bash
# Erstellt die Webseite und startet den Container mit Logging

mkdir -p html logs

cat > html/index.html <<EOF
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Willkommen</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background: #f4f4f4; margin: 0; padding: 50px; }
        .container { background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); display: inline-block; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Willkommen!</h1>
        <p>Diese Seite läuft auf Apache.</p>
    </div>
</body>
</html>
EOF

# Apache-Container starten und Logs mounten
docker run -d --name apache -p 8080:80 \
    -v $(pwd)/html:/usr/local/apache2/htdocs \
    -v $(pwd)/logs:/usr/local/apache2/logs my-apache

echo "Server läuft auf http://localhost:8080"
echo "Logs werden unter $(pwd)/logs gespeichert"
