<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  <script src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0lhC9N1j3QlNzCn2PqtPJL0tQRllKTzE&callback=initMap" async defer></script>
<style>
#map {
 		width : 100%;
        height: 500px;
      	margin-top: -11%;
    }
    
</style>
<script>

var citymap = {
		  chicago: {
		    center: {lat: ${listdetail.LAT}, lng: ${listdetail.LNG}},
		    population: 2714856
		  }
		};

function initMap() {
	  // Create the map.
	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 15,
	    center: {lat: ${listdetail.LAT}, lng: ${listdetail.LNG}},
	    mapTypeId: 'terrain'
	  });

	  
	  // Construct the circle for each value in citymap.
	  // Note: We scale the area of the circle based on the population.
	  for (var city in citymap) {
	    // Add the circle for this city to the map.
	    var cityCircle = new google.maps.Circle({
	      strokeColor: '#0000FF',
	      strokeOpacity: 0.5,
	      strokeWeight: 2,
	      fillColor: '#0000FF',
	      fillOpacity: 0.15,
	      map: map,
	      center: citymap[city].center,
	      radius: Math.sqrt(10) * 100
	    });
	  }
	  function toggleBounce() {
		  if (marker.getAnimation() !== null) {
		    marker.setAnimation(null);
		  } else {
		    marker.setAnimation(google.maps.Animation.BOUNCE);
		  }
		}
	  marker = new google.maps.Marker({
		    map: map,
		    draggable: true,
		    animation: google.maps.Animation.DROP,
		    position: {lat: ${listdetail.LAT}, lng: ${listdetail.LNG}}
		  });
	  
		  marker.addListener('click', toggleBounce);
	  
	}
  

</script>


</head>
<body>
 <div id="map"></div>
 
 
     
</body>
</html>