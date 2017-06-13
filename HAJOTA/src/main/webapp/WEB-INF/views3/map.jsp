<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEM1_6g0M675zuc-nJwdmBf-reTcY_v60"></script>

<style>
#map {
	width: 100%;
	height: 800px;
}
</style>

<script type="text/javascript">
	var posi = new Array;
	
	$(document).ready(function() {
		$.ajax({ //지오코딩 getJSON 으로 해도 될듯 함.
			url : "https://maps.googleapis.com/maps/api/geocode/json",
			dataType : "json",
			method : "GET",
			data : {
				address : "당산역 맥도날드",
				key : "AIzaSyBEM1_6g0M675zuc-nJwdmBf-reTcY_v60"
			},
			success : function(data) {

				if (data.status == "OK") {
					var i = 0;

					$.map(data.results, function(item) {
						//alert(item.formatted_address);
						 
						$("#lat").append(
								"<option>" + item.geometry.location.lat
										+ "</option>");
						$("#lng").append(
								"<option>" + item.geometry.location.lng
										+ "</option>");
						
						posi[i] = [ item.geometry.location.lat,
								item.geometry.location.lng ];
						i++;
					});
				}
			} // end of success
		}); //  end of ajax
	}); // end of ready
</script>

<script>
	// 맵 초기화해서 센터에 둘 부분
	function initialize() {
		var mapCanvas = document.getElementById('map');

		var Position_center = new google.maps.LatLng(posi[0][0], posi[0][1]);
		var mapOptions = {
			center : Position_center,
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		var map = new google.maps.Map(mapCanvas, mapOptions);

		setMarkers(map, posi);
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);

	// 마커 부분
	function setMarkers(map, locations) {

		for (var i = 0; i < locations.length; i++) {
			//console.log(locations[i][0]+' '+ locations[i][1]);
			var myLatLng = new google.maps.LatLng(locations[i][0],
					locations[i][1]);
			var marker = new google.maps.Marker({
				position : myLatLng,
				map : map
			});
		}
	}
</script>

</head>
<body>
 
	<select id="lat">

	</select>
	<select id="lng">
 
	</select>
	<div id="map"></div>
	
</body>
</html>