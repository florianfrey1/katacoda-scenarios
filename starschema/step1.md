# Umgebung einrichten
***

# Datenbank erstellen

Im ersten Schritt legen wir eine neue Postgres-Datenbank an.

Dafür verwenden in diesem Beispiel Docker für das Ausführen der Postgres-Datenbank:

`docker run \
      --name postgres_starschema_demo \
      -e POSTGRES_PASSWORD=password \
      -p 5432:5432 \
      -d postgres`{{execute}}

<div style="background: #29bfff; width: 100%; border-radius: 3px; box-sizing: border-box; padding: 20px; margin: 20px 0; color: black">
    <div style="font-size: 120%; font-weight: bold; display: inline; position: relative">🛈</div>
    <div style="position: relative; display: inline; font-weight: bold">Beschreibung des Befehls</div>
    <ol>
      <li><strong>--name</strong>: Name der Datenbank.</li>
      <li><strong>-e POSTGRES_PASSWORD</strong>: Passwort der Datenbank.</li>
      <li><strong>-p</strong>: Portmapping eines internen auf einen externen Port.</li>
      <li><strong>-d</strong>: Das Docker-Image.</li>
    </ol>
</div>

<div style="background: #ffb829; width: 100%; border-radius: 3px; box-sizing: border-box; padding: 20px; margin: 20px 0; color: black">
    <div style="font-weight: bold; display: inline; position: relative">⚠</div>
    <div style="position: relative; display: inline; font-size: 120%; font-weight: bold">Startzeit eines Docker-Containers</div>
    <p>Das Starten eines Docker-Containers kann etwas Zeit in Anspruch nehmen. Wird der nachfolgende Befehl zu früh ausgeführt, kann es dementsprechend zu einem Fehler kommen.</p>
</div>

Postgres CLI starten:
`docker exec -ti -u postgres postgres_starschema_demo psql`{{execute}}

Eine Datenbank anlegen:
`CREATE DATABASE starschema_demo; \q`{{execute}}

## NodeJS Projekt einrichten

Für das einrichten eines neuen NodeJS Projekts nutzen wir den Init-Befehl von NPM. Anschließend installieren wir lokal das Paket *pg* mithilfe von NPM.

`npm init -y
npm i pg`{{execute}}

Jetzt können wir testen, ob alles erfolgreich initialisiert wurde:

`node test.js`{{execute}}<br>