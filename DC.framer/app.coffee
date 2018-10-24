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
	zoom: 14.91
	center: [151.192,-33.888]
	# Add Mapbox style url
	style: 'mapbox://styles/perrindesign/cjn9w8ey14gur2rnrzx55o14r'

mapLayer.ignoreEvents = false

map.on('load', function() {
	map.loadImage('https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Cat_silhouette.svg/400px-Cat_silhouette.svg.png', function(error, image) {
		if (error) throw error;
		map.addImage('cat', image);
		map.addLayer({
			"id": "points",
			"type": "symbol",
			"source": {
				"type": "geojson",
				"data": {
					"type": "FeatureCollection",
					"features": [{
						"type": "Feature",
						"geometry": {
							"type": "Point",
							"coordinates": [151.192,-33.888]
						}
					}]
				}
			},
			"layout": {
				"icon-image": "cat",
				"icon-size": 0.25
			}
		});
	});
});