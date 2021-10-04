var mqtt = require('mqtt')
var client  = mqtt.connect('mqtt://127.0.0.1:1883')

client.on('connect', function () {
  console.log('connected...')

  client.subscribe('hi', function (err) {
    if (!err) {
      client.publish('hi', 'Hello mqtt')
      client.publish('hi', 'huhu')
    }
  })
})

client.on('message', function (topic, message) {
  console.log(topic, message.toString())
  client.end()
})