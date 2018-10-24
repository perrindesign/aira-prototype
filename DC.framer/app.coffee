{ mapboxgl } = require "npm"

Utils.insertCSS('@import url(https://api.tiles.mapbox.com/mapbox-gl-js/v0.43.0/mapbox-gl.css)')

mapLayer = new Layer
	height: Screen.height
	width: Screen.width

mapLayer.html = "<div id='map'></div>"
mapElement = mapLayer.querySelector("#map")
mapElement.style.height = Screen.height + 'px'

mapboxgl.accessToken = 'pk.eyJ1IjoicGVycmluZGVzaWduIiwiYSI6ImNqbjl3NnR4NjA2YXIzcW44cXoxcmIwMGMifQ.4zuRaWTefn599K9POZhznQ'

map = new mapboxgl.Map
	container: mapElement
	zoom: 12
	center: [-77.01866, 38.888]
	# Add Mapbox style url
	style: 'mapbox://styles/perrindesign/cjn9w8ey14gur2rnrzx55o14r'

mapLayer.ignoreEvents = false