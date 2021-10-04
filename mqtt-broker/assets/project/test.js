var mqtt = require('mqtt')
var client  = mqtt.connect('mqtt://test.mosquitto.org')

client.on('connect', function () {
  console.log('connected...')

  client.subscribe('hi', function (err) {
    if (!err) {
      client.publish('hi', 'Hello mqtt')
    }
  })
})

client.on('message', function (topic, message) {
  // message is Buffer
  console.log(topic, message.toString())
  client.end()
})