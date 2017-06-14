<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	var seq_lodge = [];
	var lat = [];
	var lon = [];
	var total_price = [];
		
	$(document).ready(function() {
		
		<c:if test="${roomsLocationInfoList == null}">
			alert("검색 항목 없음");
		</c:if>
		
		<c:if test="${roomsLocationInfoList != null}">
			<c:forEach var="roomsLocationInfo" items="${roomsLocationInfoList}" varStatus="status">
				seq_lodge[${status.index}] = ${roomsLocationInfo.SEQ_LODGE};
				lat[${status.index}] = ${roomsLocationInfo.LAT};
				lon[${status.index}] = ${roomsLocationInfo.LON};
				total_price[${status.index}] = ${roomsLocationInfo.TOTAL_PRICE};
			</c:forEach>
		</c:if>
		
		var location = [];
		
		$.ajax({ //지오코딩 getJSON 으로 해도 될듯 함.
			url : "https://maps.googleapis.com/maps/api/geocode/json",
			dataType : "json",
			method : "GET",
			data : {
				address : "당산역 버거킹",
				key : "AIzaSyBEM1_6g0M675zuc-nJwdmBf-reTcY_v60"
			},
			success : function(data) {
				
				if (data.status == "OK") {
					for(var i = 0; i < seq_lodge.length; ++i) {
						 posi[i] = [ lat[i], lon[i] ];
					 }

					$.map(data.results, function(item) {
				/* 		
						if(${roomsLocationInfo != null}) {
							posi[i] = [ item.geometry.location.lat,
								item.geometry.location.lng ];
						}
				 */		
						//alert(item.formatted_address);
						/* 
						$("#lat").append(
								"<option>" + item.geometry.location.lat
										+ "</option>");
						$("#lng").append(
								"<option>" + item.geometry.location.lng
										+ "</option>");
						 */
						 
						 for(var i = 0; i < seq_lodge.length; ++i) {
							 posi[i] = [ lat[i], lon[i] ];
						 }
					});
				}
			} // end of success
		}); //  end of ajax
	}); // end of ready
	
	// 맵 초기화해서 센터에 둘 부분
	function initialize() {
		var mapCanvas = document.getElementById('map');

		// TODO : 검색한 위도 경도가 들어올 예정
		var Position_center = new google.maps.LatLng(posi[0][0], posi[0][1]);
		
		var mapOptions = {
			center : Position_center,
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		
		var map = new google.maps.Map(mapCanvas, mapOptions);
		
		setMarkers(map, lat, lon);
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
	var infowindow = new google.maps.InfoWindow();

	// 마커 부분
	function setMarkers(map, lat, lon) {
		var marker = [];
		var contentString = [];

		for (var i = 0; i < lat.length; ++i) {
			var myLatLng = new google.maps.LatLng(lat[i], lon[i]);
			
			// 각종 정보 넣어 주면 될 것 같음
			contentString[i] = '<div id="content">' + '<h1 id="firstHeading" class="firstHeading">' + total_price[i] + '</h1>' + '</div>';
			
			marker[i] = new google.maps.Marker({
				position : myLatLng,
				map : map,
				content : contentString[i]
			});			
			 
			marker[i].addListener('click', function() {
				infowindow.setContent(this.content);
				infowindow.open(map, this);
			});
		}
	}
</script>

</head>
<body>
<!-- 
	<select id="lat">

	</select>
	<select id="lng">
 
	</select>
-->
	<div id="map"></div>
</body>
</html>