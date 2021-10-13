Die Umgebung wird konfiguriert.
Bitte habe einen Moment Geduld...
Wenn eine leere Kommandozeile erscheint, kannst du fortfahren.

<div style="background: #29bfff; width: 100%; border-radius: 3px; box-sizing: border-box; padding: 20px; margin: 20px 0; color: black">
    <div style="position: relative; font-size: 110%; font-weight: bold">🛈 Quellcode</div>
    <p>Den Quellcode zu dieser Katacoda findest du auf <a href="https://github.com/florianfrey1/katacoda-scenarios/tree/main/mqtt-broker">GitHub</a>.</p>
</div>

# Komponenten

Als MQTT-Broker wird HiveMQ in der Community-Edition in einem Docker-Container eingesetzt [10], [11].
Die Publish- und Subscribe-Clients des Beispiels werden in Javascript (NodeJS) umgesetzt [12].
Für die parallele Ausführung der Clients wird PM2 verwendet [13].