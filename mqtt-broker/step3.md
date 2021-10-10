

<pre class="file" data-filename="publisher.js" data-target="replace">
const mqtt = require('mqtt')
const client = mqtt.connect('mqtt://localhost:1883', { will: { topic: 'random_data', payload: 'Publisher ist raus!' } })

client.on('connect', function () {
    setInterval(() => {
        const randomData = (Math.floor(Math.random() * 1e12)).toString(16)
        client.publish('random_data', randomData)
        console.log(`Veröffentlicht in 'random_data': ${randomData}`)
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
    console.log(`Empfangen von '${topic}': ${message.toString()}`)
})
</pre>

`pm2 start publisher.js
pm2 start subscriber.js --name subscriber_1
pm2 start subscriber.js --name subscriber_2`{{execute}}

`pm2 logs`{{execute}}
`pm2 monit`{{execute}}
`pm2 delete publisher`{{execute}}