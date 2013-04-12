lastMinutes = 2 # keep data for last x minutes
chart = new Highcharts.Chart
  chart:
    renderTo: "container"
    type: "spline"
  title:
    text: "Raspberry Pi CPU Temperature"
    style:
      fontWeight: 'bold'
      fontSize: '16px'
      fontFamily: 'Trebuchet MS, Verdana, sans-serif'    
  xAxis:
    type: 'datetime'
  yAxis:
    title:
      text: "Temperature (\u00B0C)"
  tooltip:
    formatter: ->
      "<b>" + Highcharts.dateFormat('%H:%M:%S', @x) + 
        "</b><br><b>" + @y + " \u00B0C</b>"
  series: [
    name: "Raspberry Pi"
    data: []
  ]
  
# Listen out for temperature event coming from the server
ss.event.on "temperature", (data) ->
  series = chart.series[0]
  redraw = true
  shift = series.data.length > lastMinutes * 60 
  series.addPoint [data.time, parseInt(data.value)], redraw, shift
  