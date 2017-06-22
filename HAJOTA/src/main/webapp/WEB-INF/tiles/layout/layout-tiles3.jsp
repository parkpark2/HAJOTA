<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #35. tiles 를 사용하는 레이아웃 페이지 만들기  ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tiles 를 사용한 게시판 페이지 작성하기</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  
<style>

body#JH_layout_roomsList_body {
	width: 100%;
	height: 100%;
	overflow: hidden;
	background-color: #FFFFFF;
	margin-top: -1%;
}

div#JH_layout_roomsList {
	width: 70%;
	height: 100%;
	float: inherit;
	display: inline-block;
	overflow: auto;
}

div#JH_layout_map {
	width: 30%;
	height: 100%;
	float: left;
	display: inline-block;
	position: fixed;
}

div#JH_layout_roomsListTop {
	width: 100%;
	height: 10%;
	position: relative;
}

div#JH_layout_roomsListBody {
	width: 100%;
	height: 90%;
	position: relative;
}

</style>

</head>

<body id="JH_layout_roomsList_body" >
	<div id="JH_layout_roomsListTop">
		<tiles:insertAttribute name="header" />
	</div>

	<div id="JH_layout_roomsListBody">
		<div id="JH_layout_roomsList">
			<tiles:insertAttribute name="roomslist" />
		</div>
		
		<div id="JH_layout_map">
			<tiles:insertAttribute name="map" />
		</div>
	</div>
</body>
</html>