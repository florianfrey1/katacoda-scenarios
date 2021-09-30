const { Client } = require("pg");

const credentials = {
  user: "user",
  host: "localhost",
  database: "starschema",
  password: "password",
  port: 5432,
}

async function clientDemo() {
  const client = new Client(credentials)
  await client.connect()
  const now = await client.query("SELECT NOW()")
  await client.end()

  return now
}

(async () => {
  const clientResult = await clientDemo();
  console.log("Time with client: " + clientResult.rows[0]["now"])
})()