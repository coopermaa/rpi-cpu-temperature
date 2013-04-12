# My SocketStream 0.3 app
http = require("http")
ss = require("socketstream")

# Define a single-page client called 'main'
ss.client.define "main",
  view: "app.jade"
  css: ["app.styl"]
  code: ["libs", "app"]
  tmpl: "*"

# Serve this client on the root URL
ss.http.route "/", (req, res) ->
  res.serveClient "main"

# Code Formatters
ss.client.formatters.add require("ss-coffee")
ss.client.formatters.add require("ss-jade")
ss.client.formatters.add require("ss-stylus")

# Use server-side compiled Hogan (Mustache) templates. Others engines available
ss.client.templateEngine.use require("ss-hogan")

# Minimize and pack assets if you type: SS_ENV=production node app.js
ss.client.packAssets()  if ss.env is "production"

# Start web server
server = http.Server(ss.http.middleware)
server.listen 3000

# Start SocketStream
ss.start server

# start Raspberry Pi
cpu = require('./rpi_cpu')
cpu.setReportInterval 500
cpu.on 'temperature', (err, value) ->
  now = Date.parse(new Date()) + 8 * 3600 * 1000    
  ss.api.publish.all 'temperature', 
    time: now
    value: value