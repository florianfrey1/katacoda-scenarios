const { Client } = require("pg");

const credentials = {
  user: "postgres",
  host: "localhost",
  database: "nodedemo",
  password: "yourpassword",
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