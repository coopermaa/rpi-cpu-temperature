cpu = require './rpi_cpu'
cpu.setReportInterval 200
cpu.on 'temperature', (err, value) ->
  console.log value
