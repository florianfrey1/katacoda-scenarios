var mqtt = require('mqtt')
var client = mqtt.connect('mqtt://localhost:1883')

client.on('connect', function () {
    client.subscribe('test_channel', function (err) {
        if (!err) {
            client.publish('test_channel', 'Hello mqtt subscriber!')
        }
    })
})

client.on('message', function (topic, message) {
    console.log(`[${topic}] ${message.toString()}`)
    client.end()
})