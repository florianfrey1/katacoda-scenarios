const { Client } = require("pg")
const fs = require('fs')
const fsp = fs.promises

const credentials = {
	user: "root",
	host: "localhost",
	database: "",
	password: "password",
	port: 5432,
}

async function executeSqlFile(database, filename) {
	credentials.database = database
	const client = new Client(credentials)

	await client.connect()

	const sql = await fsp.readFile(filename)
	console.log(sql)

	await client.query(sql)
	await client.end()
}

(async () => {
	const clientResult = await executeSqlFile('star_database', '/root/project/sqls/star_database_tables.sql')
})()