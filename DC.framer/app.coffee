#MapBox GL JS Setup
{ mapboxgl } = require "npm"
{ turf } = require "npm"

map.ignoreEvents = false

# you'll need to use our own access token here
mapboxgl.accessToken = 'pk.eyJ1IjoicGVycmluZGVzaWduIiwiYSI6ImNqbjl3NnR4NjA2YXIzcW44cXoxcmIwMGMifQ.4zuRaWTefn599K9POZhznQ'

mapbox = new mapboxgl.Map
	container: map._element,
	# copy and paste your own style or one of mapbox's default styles here
	style: 'mapbox://styles/perrindesign/cjn9w8ey14gur2rnrzx55o14r'
	zoom: 17.5
	center: [151.191781,-33.892428]
	bearing: 159.00
	attributionControl: false

#Getting arc set up
origin = [
  151.196463
  -33.891803
]

inbetween = [
  151.167133
  -33.778328
]

destination = [
  151.098205
  -33.701126
]

line = 
  'type': 'Feature'
  'properties': 'stroke': '#f00'
  'geometry':
    'type': 'LineString'
    'coordinates': [
      origin
      inbetween
      destination
    ]
curved = turf.bezier(line)
curved.properties = stroke: '#0f0'
result = 
  'type': 'FeatureCollection'
  'features': [
    line
    curved
  ]

#Adding in the icons from our design
mapbox.on 'load', ->
  mapbox.addSource 'route',
    'type': 'geojson'
    'data': curved

  mapbox.addLayer
    'id': 'route'
    'source': 'route'
    'type': 'line'
    'paint':
      'line-width': 6
      'line-color': '#5872FF'


  mapbox.loadImage 'images/StartDot.png', (error, image) ->
    if error
      throw error
    mapbox.addImage 'startdot', image
    mapbox.addLayer
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
        'icon-allow-overlap' : true
    return

  mapbox.loadImage 'images/VertiportDot1.png', (error, image) ->
    if error
      throw error
    mapbox.addImage 'VertiportDot1', image
    mapbox.addLayer
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
        'icon-allow-overlap' : true
    return
  
  
  mapbox.loadImage 'images/VertiportDot2.png', (error, image) ->
    if error
      throw error
    mapbox.addImage 'VertiportDot2', image
    mapbox.addLayer
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
        'icon-allow-overlap' : true
    return
    
  
  mapbox.loadImage 'images/DestinationDot.png', (error, image) ->
    if error
      throw error
    mapbox.addImage 'DestinationDot', image
    mapbox.addLayer
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
        'icon-allow-overlap' : true
    return
  
  mapbox.loadImage 'images/CurrentLocation.png', (error, image) ->
    if error
      throw error
    mapbox.addImage 'CurrentLocation', image
    mapbox.addLayer
      'id': 'current-location'
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
                151.191773
                -33.892403
              ]
          } ]
      'layout':
        'icon-image': 'CurrentLocation'
        'icon-size': 0.3
        'icon-allow-overlap' : true
    return
    
  mapbox.loadImage 'images/OrangePointer.png', (error, image) ->
    if error
      throw error
    mapbox.addImage 'OrangeTriangle', image
    mapbox.addLayer
      'id': 'orange-triangle'
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
                151.192025
                -33.892943
              ]
          } ]
      'layout':
        'icon-image': 'OrangeTriangle'
        'icon-size': 0.4
        'icon-allow-overlap' : false
    return
    
  mapbox.loadImage 'images/PurplePointer.png', (error, image) ->
    if error
      throw error
    mapbox.addImage 'PurpleTriangle', image
    mapbox.addLayer
      'id': 'purple-triangle'
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
                151.192283
                -33.892226
              ]
          } ]
      'layout':
        'icon-image': 'PurpleTriangle'
        'icon-size': 0.4
        'icon-allow-overlap' : false
    return
    
  mapbox.addLayer
    'id': 'route1'
    'type': 'line'
    'source':
      'type': 'geojson'
      'data':
        'type': 'Feature'
        'properties': {}
        'geometry':
          'type': 'LineString'
          'coordinates': [
            [
              151.190896
              -33.889091
            ]
            [
              151.190136
              -33.889607
            ]
            [
              151.191145
              -33.890947
            ]
            [
              151.191773
              -33.892403
            ]
          ]
    'paint':
      'line-color': '#888'
      'line-width': 6
      'line-dasharray': [2, 3]
      
  mapbox.addLayer
    'id': 'route2'
    'type': 'line'
    'source':
      'type': 'geojson'
      'data':
        'type': 'Feature'
        'properties': {}
        'geometry':
          'type': 'LineString'
          'coordinates': [
            [
              151.191773
              -33.892403
            ]
            [
              151.195995
              -33.891147
            ]
            [
              151.196215
              -33.891859
            ]
          ]
    'paint':
      'line-color': '#8D52FE'
      'line-width': 6
      'line-dasharray': [2, 3]
      
  mapbox.addLayer
    'id': 'route3'
    'type': 'line'
    'source':
      'type': 'geojson'
      'data':
        'type': 'Feature'
        'properties': {}
        'geometry':
          'type': 'LineString'
          'coordinates': [
            [
              151.098205
              -33.701126
            ]
            [
              151.097972
              -33.702129
            ]
            [
              151.096922
              -33.702016
            ]
            [
              151.097134
              -33.702621
            ]
            [
              151.096734
              -33.702601
            ]
            [
              151.096645
              -33.703157
            ]
            [
              151.095494
              -33.703031
            ]
          ]
    'paint':
      'line-color': '#8D52FE'
      'line-width': 6
      'line-dasharray': [2, 3]
  return

#Removing MapBox logo for educational prototyping reasons
Utils.insertCSS "a.mapboxgl-ctrl-logo{display: none !important;}"