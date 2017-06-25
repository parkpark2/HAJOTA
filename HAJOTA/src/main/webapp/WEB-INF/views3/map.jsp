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
	height: 100%;
	position: relative;
}

div.JH_infowindow {
	width: 150px;
	height: 220px;
}

img.JH_infowidow_gallary {
	width: 100%;
	height: 70%;
}

#map-canvas img[src*="gstatic.com/"], #map-canvas img[src*="googleapis.com/"] {
	max-width: none;
}
</style>

<script type="text/javascript"> 
	var search_lat;
	var search_lon;
	
	var seq_lodge = [];
	var name = [];
	var type_lodge = [];
	var type_building = [];
	var lat = [];
	var lon = [];
	var total_price = [];
	
	var map;
	var marker = [];
	
	$(document).ready(function() {
		callRoomsInfo();
		
		if(${search_content == null || "".equals(search_content)}) {
			search_content = "당산역";
		}
		
		else {
			search_content = "${search_content}";
		}
		
		$.ajax({
			url : "https://maps.googleapis.com/maps/api/geocode/json",
			dataType : "JSON",
			method : "GET",
			data : {
				address : search_content,
				key : "AIzaSyCuM1N_3sAadL1l71rS0hBLGivpJ589HqQ"
			},
			success : function(data) {
				if (data.status == "OK") {
					$.map(data.results, function(item) {
						search_lat = item.geometry.location.lat;
						search_lon = item.geometry.location.lng;
					});
				}
			}
		});
	});
	
	// 맵 초기화해서 센터에 둘 부분
	function initialize() {
		var mapCanvas = document.getElementById('map');
		
		var Position_center = new google.maps.LatLng(search_lat, search_lon);
		
		var mapOptions = {
			center : Position_center,
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		
		map = new google.maps.Map(mapCanvas, mapOptions);
		/*
		// 드래그가 끝나면 한 번만 호출
		map.addListener('dragend', function() {
		    window.setTimeout(function() {
		    	changedCenter(map);
		    	setMarkers(map, lat, lon);
			}, 1000 / 2);
		});
		*/
		setMarkers(map, lat, lon);
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
	var infowindow = new google.maps.InfoWindow();

	// 마커 부분
	function setMarkers(map, lat, lon) {
		var contentString = [];
<%-- 		
		var myIcon = new google.maps.MarkerImage("<%= request.getContextPath() %>/resources/images/JHHY/maker.png",
				null,
			    null,
			    null,
			    new google.maps.Size(150, 100));
 --%>
		for (var i = 0; i < lat.length; ++i) {
			var myLatLng = new google.maps.LatLng(lat[i], lon[i]);
			
			// TODO : 디테일 보여주는 주소 넣어주어야 함
			// 각종 정보 넣어 주면 될 것 같음
			contentString[i] = 
				'<div class="JH_infowindow">' +
				'<a href="/hajota/rooms/detailInfo.go?seq_lodge=' + seq_lodge[i] + '">' +
				'<img class="JH_infowidow_gallary" alt="infowindowGallary" src="<%=request.getContextPath() %>/resources/images/JHHY/Sample01_00.jpg" />' +
				'</a>' +
				'<span class="project-details">' +
				'<a href="/hajota/rooms/detailInfo.go?seq_lodge=' + seq_lodge[i] + '">' + 
				'<strong>' + name[i] + '</strong>' + '<br/>' +
				'&#8361;' + total_price[i] + '&nbsp;' + type_lodge[i] + '&nbsp;' + type_building[i] + '<br/>' + '</a>' +
                '</span>' +
				'</div>';
			
			marker[i] = new google.maps.Marker({
				position : myLatLng,
				map : map,
				/* icon : myIcon, */
				seq_lodge : seq_lodge[i],
				content : contentString[i]
			});

			marker[i].addListener('click', function() {
				map.setCenter(this.position);
				infowindow.setContent(this.content);
				infowindow.open(map, this);
			});
		}
	}
	
	function callRoomsInfo() {
		<c:if test="${roomsList == null}">
			alert("검색 항목 없음");
		</c:if>
		
		<c:if test="${roomsList != null}">
			<c:forEach var="rooms" items="${roomsList}" varStatus="status">
				seq_lodge[${status.index}] = "${rooms.SEQ_LODGE}";
				name[${status.index}] = "${rooms.NAME}";
				//alert('name[${status.index}]'+"${rooms.NAME}");
				type_lodge[${status.index}] = "${rooms.TYPE_LODGE}";
				type_building[${status.index}] = "${rooms.TYPE_BUILDING}";
				lat[${status.index}] = "${rooms.LAT}";
				lon[${status.index}] = "${rooms.LON}";
				total_price[${status.index}] = "${rooms.TOTAL_PRICE}";
			</c:forEach>
		</c:if>
	}
	
	function setMapOnAll(map) {
		for(var i = 0; i < marker.length; ++i) {
			marker[i].setMap(map);
    	}
    }
	
	function clearMarkers() {
		setMapOnAll(null);
    }
	
	function changedCenter(map) {
		 clearMarkers();
		 
		$.ajax({
			url : "/hajota/rooms/moveMap.go",
			dataType : "JSON",
			method : "GET",
			data : {
				afterLat : map.getCenter().lat(),
				afterLon : map.getCenter().lng()
			},
			
			success : function(data) {				
				seq_lodge = [];
				name = [];
				type_lodge = [];
				type_building = [];
				lat = [];
				lon = [];
				total_price = [];
				
				$.each(data, function(entryIndex, entry){
					seq_lodge[entryIndex] = entry.SEQ_LODGE;
					name[entryIndex] = entry.NAME;
					type_lodge[entryIndex] = entry.TYPE_LODGE;
					type_building[entryIndex] = entry.TYPE_BUILDING;
					lat[entryIndex] = entry.LAT;
					lon[entryIndex] = entry.LON;
					total_price[entryIndex] = entry.TOTAL_PRICE;
				});
			}
		});
	}
</script>

</head>
<body>
	<div id="map" style="display: inline-block;"></div>
	
	<form name="changedCenterForm">
		<input type="hidden" id="afterLat" name="afterLat" />
		<input type="hidden" id="afterLon" name="afterLon" />
	</form>
</body>
</html>