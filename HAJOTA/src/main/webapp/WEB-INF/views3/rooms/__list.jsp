<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCuM1N_3sAadL1l71rS0hBLGivpJ589HqQ"></script>
	
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/TypeofCss/JH/JH_list.css">

<style>

.JH-absolute-control-box {
  position: absolute;
  top: 95%;
}

#map {
	width: 100%;
	height: 944px;
}

label {
	display: inline-block;
}

input {
	width: 140px;
}

.container-fluid {
	margin-top: 10px;
}

img.mainImg {
	min-width: 100%;
	padding-bottom: 5px;
}

li.span4 {
	margin-top: 20px;
}
</style>

<script type="text/javascript">
	var search_lat;
	var search_lng;
	var seq_lodge = [];
	var lat = [];
	var lon = [];
	var total_price = [];
	var map;
		
	$(document).ready(function() {
		
		<c:if test="${roomsList == null}">
			alert("검색 항목 없음");
		</c:if>
		
		<c:if test="${roomsList != null}">
			<c:forEach var="rooms" items="${roomsList}" varStatus="status">
				seq_lodge[${status.index}] = ${rooms.SEQ_LODGE};
				lat[${status.index}] = ${rooms.LAT};
				lon[${status.index}] = ${rooms.LON};
				total_price[${status.index}] = ${rooms.TOTAL_PRICE};
			</c:forEach>
		</c:if>
		
		var location = [];
		
		$.ajax({
			url : "https://maps.googleapis.com/maps/api/geocode/json",
			dataType : "json",
			method : "GET",
			data : {
				address : "${search_content}",
				key : "AIzaSyCuM1N_3sAadL1l71rS0hBLGivpJ589HqQ"
			},
			success : function(data) {
				
				if (data.status == "OK") {
					// 주소 값이 나오겠찌
					$.map(data.results, function(item) {
						search_lat = item.geometry.location.lat;
						search_lng = item.geometry.location.lng;
					});
				}
			}
		});
	});
	
	// 맵 초기화해서 센터에 둘 부분
	function initialize() {
		var mapCanvas = document.getElementById('map');

		// TODO : 검색한 위도 경도가 들어올 예정
		var Position_center = new google.maps.LatLng(search_lat, search_lng);
		
		var mapOptions = {
			center : Position_center,
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		}
		
		map = new google.maps.Map(mapCanvas, mapOptions);
		
		setMarkers(map, lat, lon);
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	
	var infowindow = new google.maps.InfoWindow();

	// 마커 부분
	function setMarkers(map, lat, lon) {
		var marker = [];
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
			
			// 각종 정보 넣어 주면 될 것 같음
			contentString[i] = '<div id="content">' + '<h1 id="firstHeading" class="firstHeading">' + total_price[i] + '</h1>' + '</div>';
			
			marker[i] = new google.maps.Marker({
				position : myLatLng,
				map : map,
				/* icon : myIcon, */
				content : contentString[i]
			});

			marker[i].addListener('click', function() {
				map.setCenter(this.position);
				infowindow.setContent(this.content);
				infowindow.open(map, this);
			});
		}
	}
	/* 
	function goLocation(lat, lon) {
		map.setCenter(new google.maps.LatLng(lat, lon))
	} */
</script>

</head>
<body>
	<div
		style="display: inline-block; width: 70%; float: left; max-height: 100%;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="carousel slide" id="myCarousel">
						<div class="carousel-inner">
							<c:if test="${roomsList == null || empty roomsList}">
								<div>등록 된 숙소가 없습니다.</div>
							</c:if>
							
							<c:if test="${roomsList != null || not empty roomsList}">
								<c:forEach var="rooms" items="${roomsList}" varStatus="status">
									<c:set var="numOfRooms" value="${status.index}"></c:set>
									
									<c:if test="${status.index == 0}">
										<div class="item active">
									</c:if>
									
									<c:if test="${(status.index != 0) && (status.index % 6 == 0)}">
										<div class="item">
									</c:if>
									
									<c:if test="${status.index % 3 == 0}">
										<ul class="thumbnails">
									</c:if>
									
									<li class="span4">
										<div class="thumbnail">
											<a href="#"><img class="mainImg"
												src="http://placehold.it/360x240" alt=""></a>
										</div>
										
										<div class="caption">
											<p><div style="display: inline-block;">${rooms.NAME}</div></p>
											<p><div style="display: inline-block;">&nbsp;&nbsp;&nbsp;&#8361; <span><fmt:formatNumber value="${rooms.TOTAL_PRICE}" pattern="#,###" /></span>원&nbsp;&nbsp;&nbsp;</div>
											<div style="display: inline-block;"><span>${rooms.NUM_OF_PEOPLE}</span>명</div></p>
											&nbsp;&nbsp;&nbsp;<a class="btn btn-mini" href="#" onclick="goLocation(${rooms.lat}, ${rooms.lon});">&raquo; 위치보기</a>
										</div>
									</li>
									
									<c:if test="${(status.index + 1) % 3 == 0}">
										</ul>
									</c:if>
									
									<c:if test="${(status.index + 1) % 6 == 0}">
										</div>
									</c:if>
								</c:forEach>
								
								<c:if test="${(numOfRooms + 1) % 3 != 0}">
									</ul>
								</c:if>
								
								<c:if test="${(numOfRooms + 1) % 6 != 0}">
									<c:if test="${(numOfRooms + 1) % 6 < 4}">
										<div style="height: 403px;">
										</div>
									</c:if>
									
									</div>
								</c:if>
							</c:if>			
						</div>
						<div class="control-box JH-absolute-control-box"
							style="margin-top: 80px;">
							<a data-slide="prev" href="#myCarousel"
								class="carousel-control left">‹</a> <a data-slide="next"
								href="#myCarousel" class="carousel-control right">›</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 
	<div
		style="display: inline-block; width: 30%; float: left; max-height: 100%;">
		<div id="map"></div>
	</div>
</body>
</html>