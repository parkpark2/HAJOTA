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
	href=>
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

<script type="text/javascript">
	$(document).ready(function() {
		
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
	} */
	
	// TODO : 세션으로 로그인 한 유저 구해서 고쳐주자
	function clickWishList(seq_lodge) {
		var div_wishlist = document.getElementById("JH_wishlist_div" + seq_lodge);
		var seq_lodge = seq_lodge;
		
		$.ajax({
			url : "/hajota/rooms/clickWishList.go",
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
</script>

</head>
<body>
	<form name="checkWishList">
			
	</form> 
	
	<!-- Begin Gallery Row -->
  	<div id="JH_list_roomList" class="span12">
  	
    <!-- Gallery Thumbnails
    ================================================== -->
    
        <div class="row clearfix no-margin">
        	<c:if test="${roomsList == null || empty roomsList}">
				<div>등록 된 숙소가 없습니다.</div>
			</c:if>
			
			<c:if test="${roomsList != null || not empty roomsList}">
				<ul class="gallery-post-grid holder">
				
				<c:forEach var="rooms" items="${roomsList}" varStatus="status">
					<li class="span3 gallery-item" data-id="id-1" data-type="illustration">
	                    <span class="gallery-hover-4col hidden-phone hidden-tablet">
	                        <span class="gallery-icons">
	                            <a href="img/gallery/gallery-img-1-full.jpg" class="item-zoom-link lightbox" title="Custom Illustration" data-rel="prettyPhoto"></a>
	                            <a href="gallery-single.htm" class="item-details-link"></a>
	                        </span>
	                    </span>
	                    
	                    <!-- TODO : 주소명, 이미지 변경하자 -->
	                    <a href="/hajota/listdetailtest.go?seq_lodge=${rooms.SEQ_LODGE}"><img src="<%=request.getContextPath() %>/resources/images/JHHY/Sample01_00.jpg" alt="Gallery"></a>
	                    <span class="project-details"><a href="/hajota/listdetailtest.go?seq_lodge=${rooms.SEQ_LODGE}"><strong>${rooms.NAME}</strong><br/>&#8361;${rooms.TOTAL_PRICE}&nbsp;숙소유형:${rooms.TYPE_LODGE}&nbsp;건물유형:${rooms.TYPE_BUILDING}<br/></a>
		                    <button type="button" style="margin-top: 2%;" onclick="goLocation(${rooms.SEQ_LODGE}, ${rooms.LAT}, ${rooms.LON});">위치보기</button>&nbsp;&nbsp;&nbsp;
		                    <button type="button" style="margin-top: 2%;" onclick="clickWishList(${rooms.SEQ_LODGE});">좋아요</button>&nbsp;&nbsp;&nbsp;
		                    
		                    <c:forEach var="roomsWishList" items="${roomsWishListInList}">
			                    <c:if test="${roomsWishList.SEQ_LODGE == rooms.SEQ_LODGE}">
			                    	<c:if test="${roomsWishList.STATUS == 1}">
			                    		<div id="JH_wishlist_div${rooms.SEQ_LODGE}" style="display: inline-block;">위시</div>
			                    	</c:if>
			                    	
			                    	<c:if test="${roomsWishList.STATUS == 0}">
			                    		<div id="JH_wishlist_div${rooms.SEQ_LODGE}" style="display: inline-block;">낫 위시</div>
			                    	</c:if>
			                    </c:if>
		                    </c:forEach>
	                    </span>	                    
	                </li>
				</c:forEach>
				</ul>
			</c:if>
		</div>
		
		<div id="JH_list_roomList_paging">
			${pagebar}
		</div>
	</div>
	
</body>
</html>