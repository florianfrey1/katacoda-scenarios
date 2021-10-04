const mqtt = require('mqtt')
const client = mqtt.connect('mqtt://localhost:1883')

client.on('connect', function () {
    setInterval(() => {
        client.publish('random_data', (Math.floor(Math.random() * 1e12)).toString(16))
    }, 1e3)
})