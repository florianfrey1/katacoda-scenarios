var mqtt = require('mqtt')
// var client  = mqtt.connect('mqtt://localhost:9001')
var client  = mqtt.connect('mqtt://test.mosquitto.org')

console.log(client)

client.on('connect', function () {
  console.log('connected...')

  client.subscribe('presence', function (err) {
    if (!err) {
      client.publish('presence', 'Hello mqtt')
    }
  })
})

client.on('message', function (topic, message) {
  // message is Buffer
  console.log(message.toString())
  client.end()
})