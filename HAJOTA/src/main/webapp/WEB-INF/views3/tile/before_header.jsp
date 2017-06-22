<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><%-- 
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/TypeofCss/JH/JH01.css">
	<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/js/JH/JH01.js"> --%>
	
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", Arial, Helvetica, sans-serif
}

.myLink {
	display: none
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#search").val("${search_content}");
		$("#numOfPeople").val("${numOfPeople}");
		/* $("#startDate").val("${startDate}");
		$("#endDate").val("${endDate}"); */
	});
</script>

<script type="text/javascript">
	function goSearch() {
		var searchFrm = document.searchFrm;
		
		searchFrm.action = "/hajota/rooms/list.go";
		searchFrm.method = "GET";
		searchFrm.submit();
	}
</script>

</head>

<body class="w3-light-grey">

	<form name="searchFrm">
	<!-- Navigation Bar -->
	<div class="w3-bar w3-white w3-border-bottom w3-xlarge">
		<img
			src="<%= request.getContextPath() %>/resources/images/oneofall/logo.png"
			style="width: 200px; height: 60px; margin-left: 30px; margin-bottom: 10px;" /> <label>
			
			
			<i class="fa fa-search-plus" style="margin-left: 270px;"></i></label>&nbsp;
			<input type="text" id="search" name="search" placeholder="search" size="10" style="height: 30px;" />&nbsp;
			<label><i class="fa fa-male"></i></label>&nbsp;
			
			
			
			
	
 			<input type="text" id="numOfPeople" name="numOfPeople" placeholder="1" size="3" style="height: 30px;" />&nbsp;
			<label><i class="fa fa-calendar-o"></i></label>&nbsp;
<!-- 
			<dropdown style=""> <input id="toggle2" type="checkbox"> <label
				for="toggle2" class="animate">인원 수<i
				class="fa fa-list float-right"></i></label>
			<ul class="animate">
				<div class="JH01-people-container">
					<div class="JH01-people-content">
						<div class="row text-center start-timer">
							<p id="JH01-title">인원 수</p>
							<div class="JH01-button button-plus-minus" id="minus-work">-</div>
							<div id="counter-work">0</div>
							<div class="JH01-button button-plus-minus" id="plus-work">+</div>
						</div>
					</div>
			</ul>
			</dropdown>

 -->



			<input type="date" class="datepicker" name="startDate" placeholder="Check In" size="10" style="height: 30px;" />&nbsp;
			<label><i class="fa fa-calendar-o"></i></label>&nbsp;
			<input type="date" class="datepicker" name="endDate" placeholder="Check Out" size="10" style="height: 30px;" />&nbsp;
			<a href="#" class="w3-button w3-hover-white w3-text-white" style="background-color: #0099ff; width: 50px; height: 50px;">
			<i class="fa fa-search" onclick="goSearch();"></i></a>
			
			
			<a href="<%= request.getContextPath() %>/index.go"> <img
			src="<%= request.getContextPath() %>/resources/images/oneofall/South Korea.png"
			style="margin-left: 100px;" />
		</a> <a href="<%= request.getContextPath() %>/indexChinese.go"> <img
			src="<%= request.getContextPath() %>/resources/images/oneofall/China.png"
			style="margin-left: 10px;" />
		</a> <img
			src="<%= request.getContextPath() %>/resources/images/oneofall/Japan.png"
			style="margin-left: 10px;" /> <img
			src="<%= request.getContextPath() %>/resources/images/oneofall/USA.png"
			style="margin-left: 10px;" /> <a href="#"
			class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
			title="question"><i class="fa fa-question-circle"></i></a> <a
			href="#"
			class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
			title="Join"><i class="fa fa-user-plus"></i></a> <a href="#"
			class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
			title="Login"><i class="fa fa-user"></i></a>
	</div>
	
	</form>
</body>