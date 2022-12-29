const express = require('express')
const os = require('os')
const app = express()
const port = 3000

app.get('/*', (req, res) => {
  res.send(`Response from app running on ${os.hostname()}`)
})

const server = app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

process.on('SIGINT', function() {
  server.close((err) => {
    process.exit(err ? 1 : 0)
  })
})