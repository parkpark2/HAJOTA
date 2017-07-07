<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/TypeofCss/JH/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/TypeofCss/JH/bootstrap-responsive.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/TypeofCss/JH/custom-styles.css">

<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/JH/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/JH/jquery.prettyPhoto.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/JH/jquery.flexslider.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/JH/jquery.custom.js"></script>


<style>
div#JH_list_roomList {
	border: solid red 0px;
	width: 97%;
	margin-left: 0px;
	padding-left: 2%;
	position: relative;
}

div#JH_list_roomList_paging {
	border: solid blue 0px;
	width: 99%;
	position: relative;
	text-align: center;
	padding-top: 3%;
}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">	
	var search_content = "${search_content}";
	var numOfPeople = "${numOfPeople}";
	var startDate = "${startDate}";
	var endDate = "${endDate}";
		
	$(document).ready(function() {
		var pageNo = "${pageNo}";
		
		if(pageNo == null || pageNo == "") {
			pageNo = 1;
		}
		
		showRoomsList(search_content, numOfPeople, startDate, endDate, pageNo);
	});


	function goLocation(seq, lat, lon) {
		
		map.setCenter(new google.maps.LatLng(lat, lon));
		
		for(var i = 0; i < marker.length; ++i) {
			if(marker[i].seq_lodge == seq) {
				google.maps.event.trigger(marker[i], 'click');
				break;
			}
		}
	}
	/* 
	function showWishList() {
		$.ajax({
			url : "/hajota/rooms/showWishList.go",
			dataType : "JSON",
			method : "GET",
			data : {
				guest_email : "ajota@ajota.com",
				seq_lodge : seq_lodge
			},
			
			success : function(data) {
				var content;
				
				if(data.status == 1) {
					content = "<span>" + "위시" + "</span>";
				}
				
				if(data.status == 0) {
					content = "<span>" + "낫 위시" + "</span>";
				}
				
				div_wishlist.innerHTML = content;
			}
		});
	}
	*/
	// TODO : 세션으로 로그인 한 유저 구해서 고쳐주자
	function clickWishList(seq_lodge) {
		var wish = $("#JH_wishlist" + seq_lodge);
		//var wish = document.getElementById("JH_wishlist" + seq_lodge);
		var seq_lodge = seq_lodge;
		var email = '${sessionScope.loginuser.EMAIL}';
		
		$.ajax({
			url : "/hajota/rooms/clickWishList.go",
			dataType : "JSON",
			method : "GET",
			data : {
				email : email,
				seq_lodge : seq_lodge
			},
			
			success : function(data) {
				var content = "";
				
				if(data.status == 1) {
					content += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/wish.png" style="width: 10%; height: 10%; padding-top: 12px; cursor: pointer; float: right;">';
				}
				
				if(data.status == 0) {
					content += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/not_wish.png" style="width: 10%; height: 10%; padding-top: 12px; cursor: pointer; float: right;">';
				}
				
				wish.html(content);
				//wish.innerHTML = content;
			}
		});
	}
	
	function showRoomsList(search_content, numOfPeople, startDate, endDate, pageNo) {
		
		$.ajax({
			url : "/hajota/rooms/listEnd.go",
			dataType : "JSON",
			method : "GET",
			data : {
				search_content : search_content,
				numOfPeople : numOfPeople,
				startDate : startDate,
				endDate : endDate,
				pageNo : pageNo
			},
			
			success : function(data) {
				
				seq_lodge = [];
				name = [];
				type_lodge = [];
				type_building = [];
				lat = [];
				lon = [];
				total_price = [];
				
				elevator = [];
				wifi = [];
				air_controller = [];
				heating = [];
				washing_machine = [];
				hair_dryer = [];
				tv = [];
				essential_item = [];
				
				var html = '<ul class="gallery-post-grid holder" style="margin-left: 10%; margin-top: -3%;">';
				
				$.each(data, function(entryIndex, entry){
					seq_lodge[entryIndex] = entry.SEQ_LODGE;
					name[entryIndex] = entry.NAME;
					type_lodge[entryIndex] = entry.TYPE_LODGE;
					type_building[entryIndex] = entry.TYPE_BUILDING;
					lat[entryIndex] = entry.LAT;
					lon[entryIndex] = entry.LON;
					total_price[entryIndex] = entry.TOTAL_PRICE;
					
					elevator[entryIndex] = entry.ELEVATOR;
					wifi[entryIndex] = entry.WIFI;
					air_controller[entryIndex] = entry.AIR_CONTROLLER;
					heating[entryIndex] = entry.HEATING;
					washing_machine[entryIndex] = entry.WASHING_MACHINE;
					hair_dryer[entryIndex] = entry.HAIR_DRYER;
					tv[entryIndex] =entry.TV;
					essential_item[entryIndex] = entry.ESSENTIAL_ITEM;
					
					html += '<div class="w3-third w3-margin-bottom w3-margin-top">'
				      	+ '<div class="w3-card-4" style="width: 300px; height: 400px;">'
				        + '<a href="/hajota/listdetailtest.go?seq_lodge=' + entry.SEQ_LODGE + '">'
				        + '<img src="<%=request.getContextPath() %>/resources/images/hajotaroom/"' + entry.IMG_MAIN + '" style="width:100%"></a>'
				        + '<div class="w3-container">'
				        + '<h3>' + entry.NAME
				        + '<a href="#" id="JH_wishlist' + entry.SEQ_LODGE + '" onclick="clickWishList(' + entry.SEQ_LODGE + ');">';
				        
				        if(entry.WISH == 0) {
				        	html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/not_wish.png" style="width: 10%; height: 10%; padding-top: 12px; cursor: pointer; float: right;">';	
				        }
				        
				        if(entry.WISH == 1) {
			        		html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/wish.png" style="width: 10%; height: 10%; padding-top: 12px; cursor: pointer; float: right;">';
				        }
				        
				    html += '</a>'
				    	+ '</h3>'
				        + '<p class="w3-opacity">&#8361;&nbsp;' + entry.TOTAL_PRICE + '</p>'
				        + '<p class="w3-large">';
				        
				        if(entry.ELEVATOR == 1) {
				        	html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/elevator.png" style="width: 10%; height: 10%;"/>';
				        }
				        
				        if(entry.WIFI == 1) {
				        	html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/wifi.png" style="width: 10%; height: 10%;"/>';
				        }
				        
				        if(entry.AIR_CONTROLLER == 1) {
				        	html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/air_controller.png" style="width: 10%; height: 10%;"/>';
				        }
				        
				        if(entry.HEATING == 1) {
					        html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/heating.png" style="width: 10%; height: 10%;"/>';
				        }
				        
				        if(entry.WASHING_MACHINE == 1) {
				        	html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/washing_machine.png" style="width: 10%; height: 10%;"/>';	
				        }
				        
				        if(entry.HAIR_DRYER == 1) {
				        	html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/hair_dryer.png" style="width: 10%; height: 10%;"/>';
				        }
				        
				        if(entry.TV == 1) {
				        	html += '<img src="<%=request.getContextPath() %>/resources/images/JHHY/JH/tv.png" style="width: 10%; height: 10%;"/>';
				        }				        
				        
				        html += '&nbsp;</p><p><button class="w3-button w3-light-grey w3-block" onclick="goLocation(' + entry.SEQ_LODGE + ', ' + entry.LAT + ', ' + entry.LON + ');">숙소 위치 보기</button></p>'
				        + '</div>'
				        + '</div>'
				        + '</div>';
				});
				
				html += '</ul>';
				
				$("#div_showRoomsList").html(html);
				
				paging(search_content, numOfPeople, startDate, endDate, pageNo);
				
				clearMarkers();
				setMarkers(map, lat, lon);
			}
		});
	}
</script>

</head>
<body>
	<form name="checkWishList">
			
	</form>
	
	<!-- Begin Gallery Row -->
  	<div id="JH_list_roomList" class="span12">
    <!-- Gallery Thumbnails
    ================================================== -->
        <div id="div_showRoomsList" class="row clearfix no-margin"><%-- --%>
        	
		</div>
		
		<div id="JH_list_roomList_paging"></div>
	</div>
</body>
