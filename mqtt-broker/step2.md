
<pre class="file" data-filename="test-mqtt-broker.js" data-target="replace">
const mqtt = require('mqtt')
const client = mqtt.connect('mqtt://localhost:1883')

client.on('connect', function () {
    client.subscribe('test_channel', function (err) {
        if (err)
            throw err

        client.publish('test_channel', 'Hello mqtt subscriber!')
    })
})

client.on('message', function (topic, message) {
    console.log(`[${topic}] ${message.toString()}`)
    client.end()
})
</pre>

`node test-mqtt-broker.js`{{execute}}