const mqtt = require('mqtt')
const client = mqtt.connect('mqtt://localhost:1883')

client.on('connect', function () {
    client.subscribe('random_data')
})

client.on('message', function (topic, message) {
    console.log(`[${topic}] ${message.toString()}`)
})