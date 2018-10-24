#MapBox GL JS Setup
{ mapboxgl } = require "npm"

Utils.insertCSS('@import url(https://api.tiles.mapbox.com/mapbox-gl-js/v0.43.0/mapbox-gl.css)')

mapLayer.html = "<div id='map'></div>"
mapElement = mapLayer.querySelector("#map")
mapElement.style.height = Screen.height + 'px'

#Token generated for access to data
mapboxgl.accessToken = 'pk.eyJ1IjoicGVycmluZGVzaWduIiwiYSI6ImNqbjl3NnR4NjA2YXIzcW44cXoxcmIwMGMifQ.4zuRaWTefn599K9POZhznQ'

#Creating a new map
map = new mapboxgl.Map
	container: mapElement
	zoom: 14.91
	center: [151.191719,-33.892273]
	attributionControl: false
	trackResize: true
	# Add Mapbox style url
	style: 'mapbox://styles/perrindesign/cjn9w8ey14gur2rnrzx55o14r'

mapLayer.ignoreEvents = false

map.resize()

#Adding in the icons from our design
map.on 'load', ->
  map.loadImage 'images/StartDot.png', (error, image) ->
    if error
      throw error
    map.addImage 'startdot', image
    map.addLayer
      'id': 'points-start'
      'type': 'symbol'
      'source':
        'type': 'geojson'
        'data':
          'type': 'FeatureCollection'
          'features': [ {
            'type': 'Feature'
            'geometry':
              'type': 'Point'
              'coordinates': [
                151.190896
                -33.889091
              ]
          } ]
      'layout':
        'icon-image': 'startdot'
        'icon-size': 0.15
    return

  map.loadImage 'images/VertiportDot1.png', (error, image) ->
    if error
      throw error
    map.addImage 'VertiportDot1', image
    map.addLayer
      'id': 'points-vertiport1'
      'type': 'symbol'
      'source':
        'type': 'geojson'
        'data':
          'type': 'FeatureCollection'
          'features': [ {
            'type': 'Feature'
            'geometry':
              'type': 'Point'
              'coordinates': [
                151.196463
                -33.891803
              ]
          } ]
      'layout':
        'icon-image': 'VertiportDot1'
        'icon-size': 0.15
    return
  
  
  map.loadImage 'images/VertiportDot2.png', (error, image) ->
    if error
      throw error
    map.addImage 'VertiportDot2', image
    map.addLayer
      'id': 'points-vertiport2'
      'type': 'symbol'
      'source':
        'type': 'geojson'
        'data':
          'type': 'FeatureCollection'
          'features': [ {
            'type': 'Feature'
            'geometry':
              'type': 'Point'
              'coordinates': [
                151.098205
                -33.701126
              ]
          } ]
      'layout':
        'icon-image': 'VertiportDot2'
        'icon-size': 0.15
    return
    
  
  map.loadImage 'images/DestinationDot.png', (error, image) ->
    if error
      throw error
    map.addImage 'DestinationDot', image
    map.addLayer
      'id': 'points-destination'
      'type': 'symbol'
      'source':
        'type': 'geojson'
        'data':
          'type': 'FeatureCollection'
          'features': [ {
            'type': 'Feature'
            'geometry':
              'type': 'Point'
              'coordinates': [
                151.095494
                -33.703031
              ]
          } ]
      'layout':
        'icon-image': 'DestinationDot'
        'icon-size': 0.15
    return
  return

#Removing MapBox logo for educational prototyping reasons
Utils.insertCSS "a.mapboxgl-ctrl-logo{display: none !important;}"