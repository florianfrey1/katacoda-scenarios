

<pre class="file" data-filename="publisher.js" data-target="replace">
const mqtt = require('mqtt')
const client = mqtt.connect('mqtt://localhost:1883')

client.on('connect', function () {
    setInterval(() => {
        client.publish('random_data', (Math.floor(Math.random() * 1e12)).toString(16))
    }, 1e3)
})
</pre>

<pre class="file" data-filename="subscriber.js" data-target="replace">
const mqtt = require('mqtt')
const client = mqtt.connect('mqtt://localhost:1883')

client.on('connect', function () {
    client.subscribe('random_data')
})

client.on('message', function (topic, message) {
    console.log(`[${topic}] ${message.toString()}`)
})
</pre>

`npx pm2 start publisher.js
npx pm2 start subscriber.js --name subscriber_1
npx pm2 start subscriber.js --name subscriber_2`{{execute}}

`npx pm2 logs`{{execute}}
`npx pm2 monit`{{execute}}