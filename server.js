'use strict'

const express    = require('express')
const bodyParser = require('body-parser')

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

// App
const app = express();
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

// Home
app.get('/', (req, res) => {
  res.status(200).json({ 
    message: "Hello world!"
  })
})

// Hello
app.get('/hello', (req, res) => {
  res.status(200).json({ message: `Hello ${req.query.name || "stranger"}!` })
})

// Welcome
app.post('/welcome', (req, res) => {
  res.status(200).json({ message: `Welcome ${req.body.name || "stranger"}!` })
})

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);