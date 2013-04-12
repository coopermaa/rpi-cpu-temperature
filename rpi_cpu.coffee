fs = require 'fs'
util = require 'util'
EventEmitter = require("events").EventEmitter

DEFAULT_REPORT_INTERVAL = 1000
TEMPERATURE_FILE = '/sys/class/thermal/thermal_zone0/temp'

# Test file
# TEMPERATURE_FILE = 'temp.txt'

report_thermal = (cpu) ->
  clearInterval(cpu.intervalId ) if cpu.intervalId 
  
  cpu.intervalId = setInterval ->
    fs.readFile TEMPERATURE_FILE, 'utf8', (err, data) ->    
      if err
        return cb(err) if cb
      else
        # Output will then be in mili-centigrades
        temp = parseInt(data.trim()) / 1000
        cpu.emit 'temperature', err, temp
  , cpu.report_interval

# Constructor
CPU = () ->
  EventEmitter.call(this)  
  @report_interval = DEFAULT_REPORT_INTERVAL
  @intervalId = null
  report_thermal @
  
  return @

util.inherits CPU, EventEmitter

CPU::setReportInterval = (interval) ->
  @report_interval = interval
  report_thermal @

module.exports = new CPU()