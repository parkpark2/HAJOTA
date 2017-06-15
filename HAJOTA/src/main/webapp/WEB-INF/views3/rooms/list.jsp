<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEM1_6g0M675zuc-nJwdmBf-reTcY_v60"></script>

<style>
#map {
	width: 100%;
	height: 944px;
}

label {
	display: inline-block;
}

input {
	width: 120px;
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
					
/*
					$.map(data.results, function(item) {
						
						$("#lat").append(
								"<option>" + item.geometry.location.lat
										+ "</option>");
						$("#lng").append(
								"<option>" + item.geometry.location.lng
										+ "</option>");
						 
						 
						 for(var i = 0; i < seq_lodge.length; ++i) {
							 posi[i] = [ lat[i], lon[i] ];
						 }
					});
*/					
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
		
		var myIcon = new google.maps.MarkerImage("<%= request.getContextPath() %>/resources/images/JHHY/maker.png",
				null,
			    null,
			    null,
			    new google.maps.Size(150, 100));

		for (var i = 0; i < lat.length; ++i) {
			var myLatLng = new google.maps.LatLng(lat[i], lon[i]);
			
			// 각종 정보 넣어 주면 될 것 같음
			contentString[i] = '<div id="content">' + '<h1 id="firstHeading" class="firstHeading">' + total_price[i] + '</h1>' + '</div>';
			
			marker[i] = new google.maps.Marker({
				position : myLatLng,
				map : map,
				icon : myIcon,
				content : contentString[i]
			});

			marker[i].addListener('click', function() {
				infowindow.setContent(this.content);
				infowindow.open(map, this);
			});
		}
	}
</script>

<style>
a {
	-webkit-transition: all 150ms ease;
	-moz-transition: all 150ms ease;
	-ms-transition: all 150ms ease;
	-o-transition: all 150ms ease;
	transition: all 150ms ease;
}

a:hover {
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
	/* IE 8 */
	filter: alpha(opacity = 50); /* IE7 */
	opacity: 0.6;
	text-decoration: none;
}

.thumbnails {
	width: 100%;
}

ul, ol {
	margin-bottom: 20px;
}

/* Container */
.container-fluid {
	/* background: #F5F5F5; */
	/* margin: 40px auto 10px;
	padding: 20px 40px 0; */
	max-width: 100%;
	min-height: 100%;
	/* box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); */
}

/* Page Header */
.page-header {
	background: #f9f9f9;
	/* margin: -30px -40px 40px;
	padding: 20px 40px;
	border-top: 4px solid #ccc; */
	color: #999;
	text-transform: uppercase;
}

/* thumbnail Box */
.caption h4 {
	font-size: 1rem;
	color: #444;
}

.caption p {
	font-size: 0.75rem;
	color: #999;
}

.btn.btn-mini {
	font-size: 0.63rem;
}

/* Carousel Control */
.control-box {
	text-align: center;
	width: 100%;
}

.carousel-control {
	background: #666;
	border: 0px;
	border-radius: 0px;
	display: inline-block;
	font-size: 34px;
	font-weight: 200;
	line-height: 18px;
	opacity: 0.5;
	padding: 4px 10px 0px;
	position: static;
	height: 30px;
	width: 40px;
}

/* Footer */
.footer {
	margin: auto;
	width: 100%;
	max-width: 960px;
	display: block;
	font-size: 0.69rem;
}

.footer, .footer a {
	color: #c9e4f7;
}

p.right {
	float: right;
}
/* 
/* Mobile Only */
@media ( max-width : 767px) {
	.page-header, .control-box {
		text-align: center;
	}
}

@media ( max-width : 479px) {
	.caption {
		word-break: break-all;
	}
}

::-moz-selection {
	background: #ff5e99;
	color: #F5F5F5;
}

a, a:focus, a:active, a:hover, object, embed {
	outline: none;
}

:-moz-any-link:focus {
	outline: none;
}

input::-moz-focus-inner {
	border: 0;
}
</style>

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
											<h4>${rooms.NAME}</h4>
											<p>Nullam Condimentum Nibh Etiam Sem</p>
											<a class="btn btn-mini" href="#">&raquo; Read More</a>
										</div>
									</li>
									
									<c:if test="${(status.index != 0) && (status.index % 3 == 0)}">
										</ul>
									</c:if>
									
									<c:if test="${(status.index != 0) && (status.index % 6 == 0)}">
										</div>
									</c:if>
								</c:forEach>
								
								<c:if test="${(numOfRooms == 0) && (numOfRooms % 3 != 0)}">
									</ul>
								</c:if>
								
								<c:if test="${(numOfRooms == 0) && (numOfRooms % 6 != 0)}">
									</div>
								</c:if>
							</c:if>
							
							<div class="control-box" style="margin-top: 80px;">
								<a data-slide="prev" href="#myCarousel"
									class="carousel-control left">‹</a> <a data-slide="next"
									href="#myCarousel" class="carousel-control right">›</a>
							</div>
									
							<%--
							<div>${rooms.SEQ_LODGE}</div>
							<div>${rooms.HOST_EMAIL}</div>
							<div>${rooms.NAME}</div>
							<div>${rooms.TYPE_LODGE}</div>
							<div>${rooms.TYPE_BUILDING}</div>
							<div>${rooms.LOCATION}</div>
							<div>${rooms.LAT}</div>
							<div>${rooms.LON}</div>
							<div>${rooms.IMG_MAIN}</div>
							<div>${rooms.NUM_OF_PEOPLE}</div>
							<div>${rooms.PADD_PRICE}</div>
							<div>${rooms.DEPOSIT_PRICE}</div>
							<div>${rooms.CLEAN_PRICE}</div>
							<div>${rooms.TOTAL_PRICE}</div>
							<div>${rooms.STATUS}</div>
							--%>
			
							</div>
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